import 'package:cat_price/features/Home/data/models/metals_model.dart';
import 'package:flutter/material.dart';

import '../../../../chart/data/metal_model.dart';

class Up_DownCalumn extends StatelessWidget {
  Up_DownCalumn({
    super.key,
    required this.model,
  });

  MetalItem model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          const Spacer(),
          (model.ptDaily[0] < model.ptDaily[1])
              ? Container(
                  width: 81.75,
                  height: 25,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        child: const Stack(children: [
                          Image(image: AssetImage("assets/Group.png")),
                        ]),
                      ),
                    ],
                  ),
                )
              : Container(
                  width: 81.75,
                  height: 25,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        child: const Stack(children: [
                          Image(image: AssetImage("assets/false.png")),
                        ]),
                      ),
                    ],
                  ),
                ),
          const Spacer(),
          (model.pdDaily[0] < model.ptDaily[1])
              ? Container(
                  width: 81.75,
                  height: 25,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        child: const Stack(children: [
                          Image(image: AssetImage("assets/Group.png")),
                        ]),
                      ),
                    ],
                  ),
                )
              : Container(
                  width: 81.75,
                  height: 25,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        child: const Stack(children: [
                          Image(image: AssetImage("assets/false.png")),
                        ]),
                      ),
                    ],
                  ),
                ),
          const Spacer(),
          (model.rhDaily[0] < model.ptDaily[1])
              ? Container(
                  width: 81.75,
                  height: 25,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        child: const Stack(children: [
                          Image(image: AssetImage("assets/Group.png")),
                        ]),
                      ),
                    ],
                  ),
                )
              : Container(
                  width: 81.75,
                  height: 25,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        child: const Stack(children: [
                          Image(image: AssetImage("assets/false.png")),
                        ]),
                      ),
                    ],
                  ),
                ),
          const Spacer(),

        ],
      ),
    );
  }
}
