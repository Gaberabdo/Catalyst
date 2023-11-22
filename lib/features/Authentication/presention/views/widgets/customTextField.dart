import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hinttext,
    this.phone,
    this.onchanged,
    this.height,
    this.icon,
  });
  final String? hinttext;
  final bool? phone;
  final IconData? icon;
  final double? height;
  final void Function(String?)? onchanged;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.height ?? 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "field is required";
          }
          return null;
        },
        onChanged: widget.onchanged,
        maxLines: 1,
        keyboardType:
            widget.phone == true ? TextInputType.phone : TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: Icon(widget.icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Set border radius
            borderSide: BorderSide.none, // Set border color
          ),
          filled: true,
          fillColor: Colors.grey[200],
          hintText: widget.hinttext,
          hintStyle: const TextStyle(
            color: Color(0xFF9094A0),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
