
import 'package:cat_price/features/Catlog-feature/presentation/views/view_product.dart';
import 'package:cat_price/features/Catlog-feature/presentation/views/widgets/custom_button.dart';
import 'package:cat_price/features/Catlog-feature/presentation/views/widgets/reusable_textfield.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import '../../../../../../core/core-brand/utiles/validator.dart';
import '../../../../../../generated/l10n.dart';
import '../subtitel_widget.dart';

class NameField extends StatelessWidget {
  const NameField({Key? key, required this.nameController}) : super(key: key);

  final TextEditingController nameController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTitleWidget(
          title: S.of(context).name,
        ),
        const SizedBox(height: 10),
        ReusableTextFieldContainer(
          hintText: 'eg.:electronics',
          inputType: TextInputType.text,
          controller: nameController,
          onChanged: (value) {},
          validator: (value) {
            return MyValidators.uploadProdTexts(
              value: value,
              toBeReturnedString: "Name is missed",
            );
          },
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
