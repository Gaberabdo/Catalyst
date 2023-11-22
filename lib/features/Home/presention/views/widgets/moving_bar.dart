import 'package:flutter/material.dart';

import 'most_searched_list.dart';

class MovingBar extends StatefulWidget {
  const MovingBar({super.key});

  @override
  State<MovingBar> createState() => _MovingBarState();
}

class _MovingBarState extends State<MovingBar> {
  ScrollController controller=ScrollController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ScrollbarTheme(data:const ScrollbarThemeData(
          thumbColor:MaterialStatePropertyAll(Color(0xFFFBC821),)
      ), child:Scrollbar(controller: controller,
          thumbVisibility: true,
          child:  MostSearchedList(controller: controller,)), ),
    );
  }
}
