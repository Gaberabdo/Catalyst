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

  static String userId = "653d53c2f5afc35ebe7944cb";
  static String defaultImageUrl =
      "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
}
