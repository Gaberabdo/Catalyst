import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_price/features/Authentication/presention/views/widgets/sign_up_body.dart';

import '../manager/Auth_cubit/cubit.dart';
import '../manager/Auth_cubit/state.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const SignUpBody()
    );
  }
}
