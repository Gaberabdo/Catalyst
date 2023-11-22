import 'package:flutter/material.dart';

class AppVariables {
  static List<DropdownMenuItem<String>> generateDropdownItems(
      {required List<String> items}) {
    return List<DropdownMenuItem<String>>.generate(
      items.length,
      (index) => DropdownMenuItem(
        value: items[index],
        child: Text(items[index]),
      ),
    );
  }

  static List<String> brandList = [];
  static List<String> productList = [];
  static List<String> catalyticList = [];

  static String userId = "654678ad163dba65b34dd84a";

  static List<String> brandsImage = [];
}
