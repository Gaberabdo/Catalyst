import 'package:flutter/material.dart';

import '../stayles.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({Key? key, required this.errorMessage}) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: AppStyles.textStyle18.copyWith(color: Colors.red),
      ),
    );
  }
}
