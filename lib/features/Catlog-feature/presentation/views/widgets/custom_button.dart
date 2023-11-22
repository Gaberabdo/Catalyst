import 'package:flutter/material.dart';

import '../../../../../core/core-brand/utiles/colors.dart';
import '../../../../../core/core-brand/utiles/stayles.dart';



class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title, required this.fnc})
      : super(key: key);

  final String title;
  final VoidCallback fnc;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        height: MediaQuery.of(context).size.width * 0.12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: fnc,
        color: AppColors.yellowColor,
        child: Text(
          title,
          style: AppStyles.textStyle12.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
