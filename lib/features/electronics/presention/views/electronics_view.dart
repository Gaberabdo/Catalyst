

import 'package:flutter/material.dart';
import 'package:cat_price/features/electronics/presention/views/widgets/electronics_body.dart';

import '../../../../generated/l10n.dart';

class ElectronicsView extends StatelessWidget {
  const ElectronicsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).electronics),
        centerTitle: true,
      ),
      body: const ElectronicsBody(),
    );
  }
}
