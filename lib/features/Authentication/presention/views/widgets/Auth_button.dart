import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, this.ontab, required this.text});
  final void Function()?ontab;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontab,
      child: Container(
        alignment: AlignmentDirectional.center,
        width: double.infinity,
        height: 52,
        decoration: ShapeDecoration(
          color: const Color(0xFFFBC821),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child:  Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

      ),
    );
  }
}
