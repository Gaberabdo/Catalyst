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
      duration:500,
      backgroundColor: Color.fromRGBO(251, 200, 33, 1),
      splash: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'assets/splash_screen.png',
          fit: BoxFit.cover,
        ),
      ),
      splashIconSize: double.infinity,
      pageTransitionType: PageTransitionType.topToBottom, // or use leftToRightWithFade
      nextScreen:widget,
      splashTransition: SplashTransition.sizeTransition,
    );
  }
}