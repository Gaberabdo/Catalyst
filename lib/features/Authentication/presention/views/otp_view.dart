import 'package:flutter/material.dart';
import 'package:cat_price/features/Authentication/presention/views/widgets/otp_body.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(),
      body: const OtpBody(),
    );
  }
}
