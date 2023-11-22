import 'package:flutter/material.dart';
import 'package:cat_price/features/Authentication/presention/views/widgets/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFBC821),
      body: SplashBody(),
    );
  }
}
