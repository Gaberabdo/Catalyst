
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:cat_price/features/Authentication/presention/views/widgets/sliding_image.dart';

import '../onboarding_view.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetNavagitorToHomeView();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      child:
     const Image(image: AssetImage("assets/splash screen.png"),fit: BoxFit.cover,width: double.infinity)
      ,
    );
  }

  void GetNavagitorToHomeView() {
    Future.delayed(const Duration(seconds: 2),() {
      Get.to( ()=>const OnBoardingView(),transition: Transition.upToDown ,duration: const Duration(milliseconds: 400));
    },);
  }
}
