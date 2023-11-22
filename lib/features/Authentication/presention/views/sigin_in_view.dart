
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_price/features/Authentication/presention/views/widgets/sigin_in_body.dart';
import 'package:cat_price/features/Home/presention/views/home_view.dart';

import '../manager/Auth_cubit/cubit.dart';
import '../manager/Auth_cubit/state.dart';
import 'otp_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const SignInBody()
    );
  }
}
