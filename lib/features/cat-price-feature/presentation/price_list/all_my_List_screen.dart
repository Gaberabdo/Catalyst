import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_price/features/cat-price-feature/presentation/price_list/update_list_screen.dart';

import '../../../../core/core-price-cat/models/my_list_model.dart';
import '../../../../core/core-price-cat/models/search_model.dart';
import '../../../../core/core-price-cat/resources/color_manager.dart';
import '../../../../core/core-price-cat/resources/commen_widget/share_pdf.dart';
import '../../../../core/core-price-cat/resources/font_manager.dart';
import '../../../../core/core-price-cat/resources/navigation.dart';
import '../../../../core/core-price-cat/resources/value_manager.dart';
import '../../../../generated/l10n.dart';
import '../../controller/cubit/price_list_cubit/price_cubit.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PriceCubit, PriceState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = PriceCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: ColorManager.white,
            title:  Text(S.of(context).myList),
            centerTitle: true,
          ),
          body: ConditionalBuilder(
              condition: cubit.allMyList.isEmpty && state is GetAllListsSuccessState,
              builder: (context) =>  Center(child: Text(S.of(context).noItem)),
              fallback: (context) {
                if (state is GetAllListsLodingState || state is DeleteListLodingState) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ));
                } else {
                  return ListView.separated(
                      itemBuilder: (context, index) => myItemList(
                            model: cubit.allMyList[index],
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: AppSize.s8,
                          ),
                      itemCount: cubit.allMyList.length);
                }
              }),
        );
      },
    );
  }

  Widget myItemList({required Lists model}) {
    return Card(
      elevation: 0,
      color: ColorManager.lightGrey1,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    model.listName.toString(),
                    style: TextStyle(
                        color: ColorManager.black,
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.s16),
                  ),
                ),
                const SizedBox(width: AppSize.s12,),
                InkWell(
                    onTap: (){
                       //downloadImage(model: model);
                      showDialog(context: context, builder: (context)=>Dialog(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.primary,
                          ),
                        ),
                      ));
                      //await Future.delayed( Duration(seconds: (model.listOfItems?.length)!*5));
                      generatePdf(context, model: model);
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.picture_as_pdf_rounded,
                      color: ColorManager.grey,
                    )),
                const SizedBox(width: AppSize.s12,),
                InkWell(
                    onTap: () {
                      PriceCubit.get(context).newPriceList=[];
                      model.listOfItems?.forEach((element) {
                         Items it=Items();
                        it.sId=element.iId?.sId;
                        it.name=element.iId?.name;
                        it.image= element.iId?.image;
                        it.price=element.iId?.price;
                        it.quantity=element.quantity;
                        PriceCubit.get(context).newPriceList.add(it);
                      });
                      PriceCubit.get(context).calculateTotalPrice();
                      Navigation.navigatorTo(context,  UpdateListScreen(model.sId.toString(),model.listName.toString()));
                    },
                    child: Icon(
                      Icons.edit_note,
                      color: ColorManager.primary,
                    )),
                const SizedBox(width: AppSize.s12,),
                InkWell(
                    onTap: () {
                      PriceCubit.get(context).deleteList(context, id: model.sId.toString());
                    },
                    child: Icon(
                      Icons.delete_rounded,
                      color: ColorManager.error,
                    )),

              ],
            ),
            const SizedBox(height: AppSize.s20,),
            Text(
              model.createdAt.toString(),
              style: TextStyle(
                  color: ColorManager.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.s12),
            ),
          ],
        ),
      ),
    );
  }
}
