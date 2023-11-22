import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../../core/core-brand/utiles/assets_manager.dart';
import '../../../../../core/core-brand/utiles/colors.dart';
import '../../../../../core/core-brand/utiles/stayles.dart';


class CustomDottedBorder extends StatelessWidget {
  const CustomDottedBorder({Key? key, required this.fnc}) : super(key: key);

  final VoidCallback fnc;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fnc,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.17,
        child: DottedBorder(
          color: AppColors.grayColor,
          radius: const Radius.circular(12),
          strokeWidth: 1.1,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.yellowColor,
                  radius: 25,
                  child: Image.asset(
                    AssetsManager.uploadIcon,
                    width: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  ' Click to upload image',
                  style: AppStyles.textStyle12
                      .copyWith(color: AppColors.grayColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
