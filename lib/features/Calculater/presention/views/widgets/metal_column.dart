import 'package:flutter/material.dart';

class MetalsColumn extends StatelessWidget {
  const MetalsColumn({super.key, required this.text1, required this.text2, required this.text3, });
final String text1,text2,text3;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(height: 10),
        Text(
          text1,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF9094A0),
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
       const SizedBox(height: 10),
        Text(
          text2,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF9094A0),
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text3,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF9094A0),
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
