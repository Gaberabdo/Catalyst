import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/cat-price-feature/controller/cubit/price_list_cubit/price_cubit.dart';
import '../../../../generated/l10n.dart';
import '../color_manager.dart';
import '../font_manager.dart';
import '../value_manager.dart';

Future showAddItemDialog(context) {
  final TextEditingController itemName = TextEditingController();
  final TextEditingController itemPrice = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return BlocConsumer<PriceCubit, PriceState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit=PriceCubit.get(context);
            return Dialog(
              elevation: 0,
              child: SizedBox(
                height: 500,
                child: Card(
                  elevation: 0,
                  color: ColorManager.white,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  S.of(context).addItem,
                                  style: TextStyle(
                                      color: ColorManager.black,
                                      fontSize: FontSize.s16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.close,
                                    size: 25,
                                    color: ColorManager.black,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: AppSize.s40,
                          ),
                          SizedBox(
                            height: 60,
                            child: Card(
                              elevation: 0,
                              color: ColorManager.lightGrey1,
                              child: TextFormField(
                                cursorColor: ColorManager.primary,
                                controller: itemName,
                                decoration: InputDecoration(
                                    hintText: S.of(context).itemName,
                                    labelText: S.of(context).itemName,
                                    labelStyle:
                                        TextStyle(color: ColorManager.primary),
                                    contentPadding: const EdgeInsets.all(8),
                                    border: InputBorder.none,
                                    focusColor: ColorManager.primary,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorManager.primary))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s20,
                          ),
                          SizedBox(
                            height: 60,
                            child: Card(
                              elevation: 0,
                              color: ColorManager.lightGrey1,
                              child: TextFormField(
                                cursorColor: ColorManager.primary,
                                controller: itemPrice,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: S.of(context).itemPrice,
                                    labelText: S.of(context).itemPrice,
                                    labelStyle:
                                        TextStyle(color: ColorManager.primary),
                                    contentPadding: const EdgeInsets.all(8),
                                    border: InputBorder.none,
                                    focusColor: ColorManager.primary,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorManager.primary))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s20,
                          ),
                          Text(
                            S.of(context).uploadImage,
                            style: TextStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: AppSize.s16,
                          ),
                          Container(
                            height: 170,
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: ColorManager.grey)),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ConditionalBuilder(
                                      condition: cubit.itemImage
                                              .path ==
                                          '',
                                      builder: (context) => InkWell(
                                            onTap: () {
                                              showDialog(context: context, builder: (context){
                                                return Dialog(
                                                  elevation: 0,
                                                  child: SizedBox(
                                                    width: 150,
                                                    height: 100,
                                                    child: Card(
                                                      elevation: 0,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          ElevatedButton(
                                                              onPressed: (){
                                                                cubit.selectItemImage(context,isCamera: true);
                                                              },
                                                            style: ElevatedButton.styleFrom(backgroundColor: ColorManager.primary),
                                                              child: Text(
                                                                  'Camera',
                                                                style: TextStyle(color: ColorManager.white),
                                                              ),
                                                          ),
                                                          const SizedBox(width: AppSize.s20,),
                                                          ElevatedButton(
                                                              onPressed: (){
                                                                cubit.selectItemImage(context,isCamera: false);
                                                              },
                                                            style: ElevatedButton.styleFrom(backgroundColor: ColorManager.primary),
                                                              child: Text(
                                                                  'Gallery',
                                                                style: TextStyle(color: ColorManager.white),
                                                              ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                            },
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  ColorManager.primary,
                                              radius: 30,
                                              child: Icon(
                                                Icons.image,
                                                color: ColorManager.black,
                                                size: 40,
                                              ),
                                            ),
                                          ),
                                      fallback: (context) => InkWell(
                                          onTap: () {
                                            showDialog(context: context, builder: (context){
                                              return Dialog(
                                                elevation: 0,
                                                child: SizedBox(
                                                  width: 150,
                                                  height: 100,
                                                  child: Card(
                                                    elevation: 0,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: (){
                                                            cubit.selectItemImage(context,isCamera: true);
                                                          },
                                                          style: ElevatedButton.styleFrom(backgroundColor: ColorManager.primary),
                                                          child: Text(
                                                            'Camera',
                                                            style: TextStyle(color: ColorManager.white),
                                                          ),
                                                        ),
                                                        const SizedBox(width: AppSize.s20,),
                                                        ElevatedButton(
                                                          onPressed: (){
                                                            cubit.selectItemImage(context,isCamera: false);
                                                          },
                                                          style: ElevatedButton.styleFrom(backgroundColor: ColorManager.primary),
                                                          child: Text(
                                                            'Gallery',
                                                            style: TextStyle(color: ColorManager.white),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                            },
                                          child: Image.file(
                                            cubit.itemImage,
                                            width: 80,
                                            height: 60,
                                          ))),
                                  const SizedBox(
                                    height: AppSize.s8,
                                  ),
                                  Text(
                                    S.of(context).selectImage,
                                    style: TextStyle(
                                        color: ColorManager.lightGrey2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s20,
                          ),
                          ConditionalBuilder(
                              condition: state is CreateItemLodingState || state is UploadImageItemLodingState,
                              builder: (context)=>Center(child: CircularProgressIndicator(color: ColorManager.primary,)),
                              fallback: (context)=> SizedBox(
                                width: double.infinity,
                                height: 45,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorManager.primary,
                                      shape: const BeveledRectangleBorder(
                                          borderRadius: BorderRadiusDirectional.all(
                                              Radius.circular(5)))),
                                  onPressed: () {
                                    if(itemName.text.isNotEmpty&&itemPrice.text.isNotEmpty&&cubit.itemImage.path!='') {
                                      cubit.createItem(context, name: itemName.text, price: int.parse(itemPrice.text));
                                    }
                                  },
                                  child: Text(
                                    S.of(context).save,
                                    style: TextStyle(color: ColorManager.white),
                                  ),
                                ),
                              )
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }).then((value) {
    PriceCubit.get(context).itemImage = File('');
  });
}
