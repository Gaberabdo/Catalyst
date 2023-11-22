import 'package:flutter/material.dart';

class MetalRow extends StatelessWidget {
  const MetalRow({super.key, required this.text, required this.ounce, required this.gram});
final String text;
final String ounce;
  final String gram;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
       const Spacer(),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF9094A0),
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        Text(
          '${ounce}\$',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF9094A0),
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        Text(
          '${gram}\$',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF9094A0),
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
