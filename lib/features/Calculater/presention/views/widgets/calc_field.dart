import 'package:flutter/material.dart';

class CalculaterField extends StatefulWidget {
  const CalculaterField({super.key, required this.hintText, required this.icon,this.controller, this.onsubmited,});
final String hintText;
final IconData icon;
  final void Function(String)? onsubmited;
  final TextEditingController? controller;
  @override
  State<CalculaterField> createState() => _CalculaterFieldState();
}

class _CalculaterFieldState extends State<CalculaterField> {



  @override
  Widget build(BuildContext context) {
    return  TextField(
      onSubmitted: widget.onsubmited,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xFFFBC821),width: 1
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF9094A0),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: Icon(widget.icon),
        suffixIconColor: const Color(0xFF9094A0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,width: 1
          ),
          borderRadius: BorderRadius.all(Radius.circular(12))
        ),
      ),
     cursorColor: const Color(0xFFFBC821),
     controller: widget.controller,
     maxLines: 1,
    );
  }
}
