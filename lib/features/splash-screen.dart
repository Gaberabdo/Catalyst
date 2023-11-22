import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:cat_price/features/conect%20us-feature/screens/conect-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({required this.widget});
   Widget widget;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Color.fromRGBO(251, 200, 33, 1),
      splash: 'assets/splash_screen.png',
      splashIconSize: double.infinity,
      pageTransitionType: PageTransitionType.topToBottom, // or use leftToRightWithFade
      nextScreen:widget,
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
