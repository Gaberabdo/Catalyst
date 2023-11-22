
import 'package:flutter/material.dart';


import '../../../../../../core/core-brand/utiles/validator.dart';
import '../../../../../../generated/l10n.dart';
import '../reusable_textfield.dart';
import '../subtitel_widget.dart';

class PlatinumField extends StatelessWidget {
  const PlatinumField({Key? key, required this.platinumController})
      : super(key: key);

  final TextEditingController platinumController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTitleWidget(
          title: S.of(context).platinum,
        ),
        const SizedBox(
          height: 10,
        ),
        ReusableTextFieldContainer(
          hintText: 'eg.:400',
          inputType: TextInputType.number,
          controller: platinumController,
          onChanged: (value) {},
          validator: (value) {
            return MyValidators.uploadProdTexts(
              value: value,
              toBeReturnedString: "Palladium is missed",
            );
          },
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
