import 'package:flutter/material.dart';
import 'package:cat_price/features/electronics/presention/views/widgets/electronics_body.dart';

import '../../../../generated/l10n.dart';
import '../../../Home/presention/views/home_view.dart';

class ElectronicsView extends StatelessWidget {
  const ElectronicsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(S.of(context).electronics),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => HomeView(),
              ),
              (route) => false,
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: const ElectronicsBody(),
    );
  }
}
