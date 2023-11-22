import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../generated/l10n.dart';
import '../../../data/onboard_model.dart';
import '../sigin_in_view.dart';
import 'Auth_button.dart';
import 'custom_board_item.dart';

class OnBoardBody extends StatelessWidget {
   OnBoardBody({super.key});

  PageController controller = PageController();



  @override
  Widget build(BuildContext context) {
    List<OnBoardModel> board = [
      OnBoardModel(
        image: "https://firebasestorage.googleapis.com/v0/b/mostakbal-acd29.appspot.com/o/screen1.jpg?alt=media&token=18e2fe5e-b45f-41ca-aa81-9ffd3b118c49",
        text: S.of(context).Screen1,
      ),
      OnBoardModel(
        image: "https://firebasestorage.googleapis.com/v0/b/mostakbal-acd29.appspot.com/o/screen2.jpg?alt=media&token=0d61f69e-7739-46c7-b75c-3466e1435264",
        text: S.of(context).Screen2,
      ),
      OnBoardModel(
        image: "https://firebasestorage.googleapis.com/v0/b/mostakbal-acd29.appspot.com/o/screen3.jpg?alt=media&token=38372976-f446-4364-b404-8400ad59cffe",
        text: S.of(context).Screen3,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(
              height: MediaQuery.sizeOf(context).height * .7,
              child: PageView.builder(
                allowImplicitScrolling: false,
                controller: controller,
                itemBuilder: (context, index) => CustomBoardItem(
                  model: board[index],
                  context: context,
                ),
                itemCount: board.length,
              )),
          SizedBox(
            height: 5,
            child: SmoothPageIndicator(
              controller: controller,
              count: board.length,
              effect: const ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: Color(0xFFFBC821),
                dotHeight: 7,
                expansionFactor: 4,
                dotWidth: 10,
                spacing: 5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: AuthButton(
              text: S.of(context).Start,
              ontab: () {
                Get.to(
                  () => const SignInView(),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(
                    milliseconds: 400,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
