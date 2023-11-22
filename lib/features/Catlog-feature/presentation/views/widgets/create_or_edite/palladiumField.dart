
import 'package:cat_price/features/Catlog-feature/presentation/views/view_product.dart';
import 'package:cat_price/features/Catlog-feature/presentation/views/widgets/custom_button.dart';
import 'package:cat_price/features/Catlog-feature/presentation/views/widgets/reusable_textfield.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import '../../../../../../core/core-brand/utiles/validator.dart';
import '../../../../../../generated/l10n.dart';
import '../subtitel_widget.dart';

class PalladiumField extends StatelessWidget {
  const PalladiumField({Key? key, required this.palladiumController})
      : super(key: key);

  final TextEditingController palladiumController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTitleWidget(
          title: S.of(context).paladium,
        ),
        const SizedBox(height: 10),
        ReusableTextFieldContainer(
          hintText: 'eg.:400',
          inputType: TextInputType.number,
          controller: palladiumController,
          onChanged: (value) {},
          validator: (value) {
            return MyValidators.uploadProdTexts(
              value: value,
              toBeReturnedString: "Palladium is missed",
            );
          },
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
