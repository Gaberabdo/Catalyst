import 'package:flutter/material.dart';

class SlidingImage extends StatelessWidget {
  const SlidingImage({
    super.key,
    required this.slidinganimation,
  });

  final Animation<Offset> slidinganimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidinganimation,
        builder: (context,_) {
          return SlideTransition(
              position: slidinganimation,
              child: const Image(image: AssetImage("assets/splash screen.png"),));
        }
    );
  }
}