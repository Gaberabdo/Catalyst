import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/cat-price-feature/controller/cubit/price_list_cubit/price_cubit.dart';
import '../../../../generated/l10n.dart';
import '../color_manager.dart';
import '../font_manager.dart';
import '../value_manager.dart';


Future showSaveDialog(context,{required String listName,required String id}) {
  final TextEditingController controller = TextEditingController();
  controller.text=listName;
  bool isUpdate=true;
  if(listName=='')
    {
      isUpdate=false;
    }
  return showDialog(context: context, builder: (context) {
    return Dialog(
      elevation: 0,
      child: SizedBox(
        height: 250,
        child: Card(
          color: ColorManager.white,
          elevation: 0,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      S.of(context).saveList,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSize.s20,),
                  SizedBox(
                    height: 60,
                    child: Card(
                      elevation: 0,
                      color: ColorManager.lightGrey1,
                      child: TextFormField(
                        cursorColor: ColorManager.primary,
                        controller: controller,
                        decoration: InputDecoration(
                            hintText: S.of(context).listName,
                            labelText: S.of(context).listName,
                            labelStyle: TextStyle(
                                color: ColorManager.primary
                            ),
                            contentPadding: const EdgeInsets.all(8),
                            border: InputBorder.none,
                            focusColor: ColorManager.primary,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorManager.primary
                                )
                            )
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSize.s40,),
                  BlocConsumer<PriceCubit, PriceState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      var cubit=PriceCubit.get(context);
                      return ConditionalBuilder(
                          condition: state is CreateNewListLodingState || state is UpdateListLodingState,
                          builder: (context)=>Center(child: CircularProgressIndicator(color: ColorManager.primary,)),
                          fallback: (context)=>SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:ColorManager.primary,
                                  shape: const BeveledRectangleBorder(
                                      borderRadius: BorderRadiusDirectional.all(
                                          Radius.circular(5)))),
                              onPressed: () {
                                if(controller.text.isNotEmpty) {
                                  if(isUpdate==true)
                                    {
                                      cubit.updateList(context,listName: listName,listId: id);
                                    }
                                  else {
                                    cubit.createNewList(context,listName: controller.text);
                                  }
                                }
                              },
                              child: Text(
                                S.of(context).save,
                                style: TextStyle(color: ColorManager.white),
                              ),
                            ),
                          )
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  });
}
