import 'package:flutter/material.dart';

void customSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      padding: const EdgeInsets.all(20),
      duration: const Duration(seconds: 2),
      content: Text(text),
    ),
  );
}
