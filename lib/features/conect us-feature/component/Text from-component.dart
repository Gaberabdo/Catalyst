import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {this.prefixIcon,
      required this.hintText,
      this.onTap,
      this.onSubmited,
      this.onChanged,
      this.suffixIcon,
      this.height,
      required this.emailController});
  TextEditingController? emailController;

  Widget? prefixIcon;
  String? hintText;
  String? validator;
  bool? obscureText;
  Function? onTap;
  bool? enabled = true;
  double? height;

  bool? icon;
  Widget? suffixIcon;
  Function(String)? onSubmited;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: TextField(
          onSubmitted: onSubmited,
          controller: emailController,
          onChanged: onChanged,
          scrollController: ScrollController(),
          decoration: InputDecoration(
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0), // Set border radius
              borderSide: BorderSide.none, // Set border color
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFF9094A0),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          )),
    );
  }
}

class TextFormWidget extends StatefulWidget {
  TextFormWidget(
      {super.key,
      required this.emailController,
      required this.prefixIcon,
      required this.hintText,
      required this.validator,
      this.obscureText,
      this.icon,
      this.suffixIcon,
      this.enabled});

  final TextEditingController emailController;
  final Widget prefixIcon;
  final String hintText;
  final String validator;
  bool? obscureText;
  bool? enabled = true;
  VoidCallback? onTap;
  bool? icon;
  Widget? suffixIcon;

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 327,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // Set shadow color
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 1), // Set shadow offset
          ),
        ],
      ),
      child: TextFormField(
        cursorColor: Colors.blue,
        enabled: widget.enabled,
        controller: widget.emailController,
        keyboardType: TextInputType.emailAddress,
        obscureText: widget.obscureText!,
        onFieldSubmitted: (value) {
          FocusScope.of(context).nextFocus();
        },
        validator: (String? value) {
          if (value!.isEmpty) {
            return widget.validator;
          }
          return null;
        },
        onTap: widget.onTap,
        keyboardAppearance: Brightness.dark,
        decoration: InputDecoration(
            hintText: widget.hintText,
            labelStyle: const TextStyle(fontSize: 20, color: Colors.grey),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.icon!
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.obscureText = !widget.obscureText!;
                      });
                    },
                    icon: widget.obscureText!
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.visibility_off_outlined),
                  )
                : null,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none),
      ),
    );
  }
}
