
import 'package:flutter/material.dart';
import 'package:cat_price/features/Authentication/presention/views/widgets/OnBoardBody.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: OnBoardBody(),
    );
  }
}
