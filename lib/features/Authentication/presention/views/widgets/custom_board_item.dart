import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../data/onboard_model.dart';

Widget CustomBoardItem({
  required OnBoardModel model,
  required BuildContext context,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Center(
        child: Image.network(
          model.image,
          scale: 1,
          height: MediaQuery.of(context).size.height * .4,
        ),
      ),
      Center(
        child: Text(
          S.of(context).Welcome,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      Center(
        child: SizedBox(
          width: 327,
          child: Text(
            model.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    ],
  );
}
