
import 'package:flutter/material.dart';

import '../../../../../../core/core-brand/utiles/validator.dart';
import '../../../../../../generated/l10n.dart';
import '../reusable_textfield.dart';
import '../subtitel_widget.dart';

class RhodiumField extends StatelessWidget {
  const RhodiumField({Key? key, required this.rhodiumController})
      : super(key: key);

  final TextEditingController rhodiumController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTitleWidget(
          title: S.of(context).rhodium,
        ),
        const SizedBox(
          height: 10,
        ),
        ReusableTextFieldContainer(
          hintText: 'eg.:400',
          inputType: TextInputType.number,
          controller: rhodiumController,
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
