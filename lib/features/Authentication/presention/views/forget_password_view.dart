
import 'package:flutter/material.dart';
import 'package:cat_price/features/Authentication/presention/views/widgets/forget_password_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: const ForgetPasswordBody(),
    );
  }
}
