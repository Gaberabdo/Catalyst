import 'package:flutter/material.dart';

class ReusableTextFieldContainer extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType inputType;
  const ReusableTextFieldContainer({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.validator,
    this.prefixIcon,
    required this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.yellow,
        onChanged: onChanged,
        validator: validator,
        keyboardType: inputType,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Set border radius
            borderSide: BorderSide.none, // Set border color
          ),

        ),
      ),
    );
  }
}
