import 'package:flutter/material.dart';

class Up_DownCalumn extends StatelessWidget {
  const Up_DownCalumn({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 100,
      child: Column(
        children: [
          const Spacer(),
          Container(
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
                  child: const Stack(children: [Image(image: AssetImage("assets/Group.png"))
                      ,
                      ]),
                ),
              ],
            ),
          ),
        const  Spacer(),
          Container(
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
                  child: const Stack(children: [Image(image: AssetImage("assets/false.png"))
                    ,
                  ]),
                ),
              ],
            ),
          ),
         const Spacer(),
          Container(
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
                  child: const Stack(children: [Image(image: AssetImage("assets/Group.png"))
                    ,
                  ]),
                ),
              ],
            ),
          ),
         const Spacer(),
          Container(
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
                  child: const Stack(children: [Image(image: AssetImage("assets/Group.png"))
                    ,
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
