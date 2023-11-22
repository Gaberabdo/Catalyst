import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';

class ImageButtons extends StatelessWidget {
  const ImageButtons({Key? key, required this.pickBtn, required this.removeBtn})
      : super(key: key);

  final VoidCallback pickBtn;
  final VoidCallback removeBtn;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: pickBtn,
          child: Text(
            S.of(context).pickAnotherImage,
          ),
        ),
        TextButton(
          onPressed: removeBtn,
          child: Text(
            S.of(context).removeImage,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
