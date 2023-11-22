import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/core-price-cat/resources/color_manager.dart';

import '../../../../core/core-price-cat/resources/commen_widget/price_list_widget.dart';
import '../../../../core/core-price-cat/resources/commen_widget/show_save_dialog.dart';
import '../../../../core/core-price-cat/resources/value_manager.dart';
import '../../../../generated/l10n.dart';
import '../../controller/cubit/price_list_cubit/price_cubit.dart';

class UpdateListScreen extends StatefulWidget {
  String id;
  String listName;


  UpdateListScreen(this.id, this.listName, {super.key});

  @override
  State<UpdateListScreen> createState() => _UpdateListScreenState(id,listName);
}

class _UpdateListScreenState extends State<UpdateListScreen> {

  String id;
  String listName;

  _UpdateListScreenState(this.id, this.listName);

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
            title: Text(S.of(context).update),
            centerTitle: true,
          ),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
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
                  padding:  const EdgeInsets.all(AppPadding.p20),
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
                              showSaveDialog(context,listName:listName,id: id);
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
