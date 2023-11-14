import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  static TextStyle textStyle12 = GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black);

  static TextStyle textStyle14 = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black);

  static TextStyle textStyle16 = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black);

  static TextStyle textStyle18 = GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black);

  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );

  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.normal,
  );
}
