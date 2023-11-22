
import 'package:flutter/material.dart';

import '../../../../../../core/core-brand/utiles/validator.dart';
import '../../../../../../generated/l10n.dart';
import '../reusable_textfield.dart';
import '../subtitel_widget.dart';

class WeightField extends StatelessWidget {
  const WeightField({Key? key, required this.weightController}) : super(key: key);

  final TextEditingController weightController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTitleWidget(
          title: S.of(context).weight,
        ),
        const SizedBox(height: 10),
        ReusableTextFieldContainer(
          hintText: 'eg.:200',
          inputType: TextInputType.number,
          controller: weightController,
          onChanged: (value) {},
          validator: (value) {
            return MyValidators.uploadProdTexts(
              value: value,
              toBeReturnedString: "Weight is missed",
            );
          },
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
