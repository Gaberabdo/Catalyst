import 'package:flutter/material.dart';
import 'package:cat_price/features/Calculater/presention/views/widgets/calculater_body.dart';
import 'package:cat_price/generated/l10n.dart';

class CalculaterView extends StatelessWidget {
  const CalculaterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          S.of(context).Calculator,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: const CalculaterBody(),
    );
  }
}
