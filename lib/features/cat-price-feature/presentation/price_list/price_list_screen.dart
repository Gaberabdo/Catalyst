import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_price/features/cat-price-feature/presentation/price_list/search_screen.dart';

import '../../../../core/core-price-cat/resources/assets_manager.dart';
import '../../../../core/core-price-cat/resources/color_manager.dart';

import '../../../../core/core-price-cat/resources/commen_widget/add_item_dialog.dart';
import '../../../../core/core-price-cat/resources/commen_widget/price_list_widget.dart';
import '../../../../core/core-price-cat/resources/commen_widget/show_save_dialog.dart';
import '../../../../core/core-price-cat/resources/navigation.dart';
import '../../../../core/core-price-cat/resources/value_manager.dart';
import '../../../../generated/l10n.dart';
import '../../controller/cubit/price_list_cubit/price_cubit.dart';
import 'all_my_List_screen.dart';

class PriceListScreen extends StatefulWidget {
  const PriceListScreen({Key? key}) : super(key: key);

  @override
  State<PriceListScreen> createState() => _PriceListScreenState();
}

class _PriceListScreenState extends State<PriceListScreen> {
  @override

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PriceCubit, PriceState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit =PriceCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        title:  Text(S.of(context).priceList),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: AppPadding.p12, left: AppPadding.p12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigation.navigatorTo(context, const SearchScreen());
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: ColorManager.lightGrey1,
                            child: const Image(
                                image: AssetImage(IconAssets.searchIcon)),
                          ),
                          const SizedBox(
                            height: AppSize.s8,
                          ),
                           Text(
                            S.of(context).searchItem,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: AppSize.s12,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showAddItemDialog(context);
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: ColorManager.lightGrey1,
                            child: const Image(
                                image: AssetImage(IconAssets.addItemIcon)),
                          ),
                          const SizedBox(
                            height: AppSize.s8,
                          ),
                           Text(S.of(context).addItem)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: AppSize.s12,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        cubit.getAllLists();
                        Navigation.navigatorTo(context, const MyListScreen());
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: ColorManager.lightGrey1,
                            child: const Image(
                                image: AssetImage(IconAssets.listIcon)),
                          ),
                          const SizedBox(
                            height: AppSize.s8,
                          ),
                           Text(S.of(context).myList)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: AppSize.s12,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          cubit.newPriceList=[];
                          cubit.totalPrice=0;cubit.myItems=0;
                        });
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: ColorManager.lightGrey1,
                            child: const Icon(Icons.cleaning_services_rounded)),
                          const SizedBox(
                            height: AppSize.s8,
                          ),
                           Text(S.of(context).clear)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ConditionalBuilder(
                  condition: cubit.newPriceList.isEmpty,
                  builder: (context)=> Center(child: Text(S.of(context).noItem)),
                  fallback: (context){
                    if(state is SearchForItemLodingState) {
                      return  Center(child: CircularProgressIndicator(color: ColorManager.primary,));
                    } else
                    {
                      return ListView.separated(
                          itemBuilder: (context, index) => itemList(model: cubit.newPriceList[index],index: index),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: AppSize.s8,
                          ),
                          itemCount: cubit.newPriceList.length);
                    }
                  }
              ),
            ),
            Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Card(
                    color: ColorManager.white,
                    elevation: 0.4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text(
                                S.of(context).myItems,
                              ),
                              Text(
                                cubit.myItems.toString(),
                                style: TextStyle(
                                    color: ColorManager.primary
                                ),
                              ),
                            ],
                          ),
                          Container(
                            color: ColorManager.primary,
                            height: AppSize.s1,
                            margin: const EdgeInsets.only(left: 40,right: 40,top: 12,bottom: 12),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text(
                                 S.of(context).totalPrice,
                              ),
                              Text(
                                cubit.totalPrice.toString(),
                                style: TextStyle(
                                    color: ColorManager.primary
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSize.s12,),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: (cubit.newPriceList.isNotEmpty)?ColorManager.primary:ColorManager.lightGrey1,
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadiusDirectional.all(
                                  Radius.circular(5)))),
                      onPressed: () {
                        if(cubit.newPriceList.isNotEmpty) {
                          showSaveDialog(context,listName: '',id: '');
                        }
                      },
                      child: Text(
                        S.of(context).save,
                        style: TextStyle(color: ColorManager.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  },
);
  }

}
