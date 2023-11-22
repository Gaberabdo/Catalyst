import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import 'type_item.dart';

class ElectronicsBody extends StatelessWidget {
  const ElectronicsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        TypeItem(
          imageName: 'assets/computer.png',
          title: S.of(context).Computer,
          type: "Computer",
        ),
        TypeItem(
          imageName: 'assets/ram.png',
          title: S.of(context).Ram,
          type: "Ram",
        ),
        TypeItem(
          imageName: 'assets/cdroom.png',
          title: S.of(context).CdRoom,
          type: "CdRoom",
        ),
        TypeItem(
          imageName: 'assets/power_supply.png',
          title: S.of(context).PowerSupply,
          type: "Power Supply",
        ),
        TypeItem(
          imageName: 'assets/motherboard.png',
          title: S.of(context).Motherboard,
          type: "Motherboard",
        ),
      ],
    );
  }
}

const Color primary = Color(0xfff2f9fe);
const Color secondary = Color(0xFFdbe4f3);
const Color black = Color(0xFF000000);
const Color white = Color(0xFFFFFFFF);
const Color grey = Colors.grey;
const Color red = Color(0xFFec5766);
const Color green = Color(0xFF43aa8b);
const Color blue = Color(0xFF28c2ff);
const Color buttoncolor = Color(0xff3e4784);
const Color mainFontColor = Color(0xff565c95);
const Color arrowbgColor = Color(0xffe4e9f7);
