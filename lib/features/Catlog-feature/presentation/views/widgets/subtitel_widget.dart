import 'package:flutter/material.dart';

import '../../../../../core/core-brand/utiles/stayles.dart';


class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      style: AppStyles.textStyle14,
    );
  }
}
