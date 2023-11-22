import 'package:flutter/material.dart';


import '../color_manager.dart';
import '../font_manager.dart';
import '../value_manager.dart';

Future showMassageFromServer(context,{required String mes}){

  return showDialog(context: context, builder:(context){
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Center(
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  mes,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: ColorManager.error,
                      fontSize: FontSize.s16
                  ),
                ),
                const SizedBox(
                  height: AppSize.s40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary
                  ),
                    onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Cancel',style: TextStyle(color: ColorManager.white),))
              ],
            ),
          ),
        ),
      ),
    );
  });
}