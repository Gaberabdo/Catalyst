import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cat_price/features/Home/presention/manager/metals_cubit/cubit.dart';
import 'package:cat_price/features/Home/presention/manager/metals_cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';

import '../../../data/models/slider_item.dart';


class MovingText extends StatelessWidget {
  const MovingText({super.key});

  @override
  Widget build(BuildContext context) {
    List<SliderItem> item =[];

    return BlocProvider(
      create: (context) => MetalsCubit()..getSlider(),
      child: BlocConsumer<MetalsCubit, MetalsState>(
        listener: (context, state) {
          if(state is GetSliderSuccessState){
            item.addAll(state.item.sliders);
          }

        },
        builder: (context, state) {
          return CarouselSlider(
            items: item.map((e) {
              return Container(
                width: double.infinity,
                height: 52,
                color: const Color(0xFFFBC821),
                alignment: AlignmentDirectional.center,
                child: (state is GetSliderSuccessState)? AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      e.listOfSliders.isNotEmpty?
                      e.listOfSliders[0] : "",
                      speed: const Duration(milliseconds: 200),
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                      ),
                    )
                  ],
                ) : null,
              );
            }).toList(),
            options: CarouselOptions(
              autoPlayAnimationDuration: const Duration(milliseconds: 200),
              autoPlayCurve: Curves.fastOutSlowIn,
              height:52,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              enableInfiniteScroll: true,
              initialPage: 0,
              reverse: false,
              viewportFraction: 1.0,
            ),
          );
        },
      ),
    );
  }
}
