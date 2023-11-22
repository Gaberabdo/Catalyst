
import 'package:flutter/material.dart';
import 'package:cat_price/features/Authentication/presention/views/widgets/create_new_password_body.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: const CreateNewPasswordBody(),
    );
  }
}
