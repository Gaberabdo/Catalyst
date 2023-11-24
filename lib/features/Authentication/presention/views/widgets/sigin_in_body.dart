import 'package:cat_price/core/core-brand/utiles/app_functions.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart ' as bloc;
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:cat_price/features/Home/presention/views/home_view.dart';
import 'package:cat_price/generated/l10n.dart';

import '../../manager/Auth_cubit/cubit.dart';
import '../../manager/Auth_cubit/state.dart';
import '../forget_password_view.dart';
import '../otp_view.dart';
import '../sign_up_view.dart';
import 'Auth_button.dart';
import 'customTextField.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  GlobalKey<FormState> formkey = GlobalKey();
  String? email;
  String? password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  @override
  Widget build(BuildContext context) {
    return bloc.BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SuccessSignIn) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
            (route) => false,
          );
        }
        if (state is ErrorSignIn) {
          AppFunction.showErrorORWarningDialog(
            context: context,
            subtitle: state.error,
            fct: () {},
          );
        }
      },
      builder: (context, state) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Center(
                  child: Text(
                    S.of(context).Signin,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF010101),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    S.of(context).WelcomeBackWemissedyou,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF9094A0),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Text(
                  S.of(context).Email,
                  style: const TextStyle(
                    color: Color(0xFF010101),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hinttext: S.of(context).EnterYourEmail,
                  onchanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).Password,
                  style: const TextStyle(
                    color: Color(0xFF010101),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hinttext: S.of(context).EnterYourPassword,
                  onchanged: (value) {
                    password = value;
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          S.of(context).ForgetPassword,
                          style: const TextStyle(
                            color: Color(0xFFFBC821),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 0.11,
                          ),
                        )),
                  ),
                ),
                ConditionalBuilder(
                  condition: state is! LoadingSignIn,
                  builder: (context) => AuthButton(
                    text: S.of(context).Signin,
                    ontab: () async {
                      if (formkey.currentState!.validate()) {
                        await bloc.BlocProvider.of<AuthCubit>(context).Signin(
                            email: email.toString(),
                            password: password.toString());
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                  fallback: (context) => const Center(
                      child:
                          CircularProgressIndicator(color: Color(0xFF010101))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).Donthaveanaccount,
                      style: const TextStyle(
                        color: Color(0xFF010101),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 0.11,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SignUpView();
                              },
                            ),
                          );
                        },
                        child: Text(
                          S.of(context).Signup,
                          style: const TextStyle(
                            color: Color(0xFFFBC821),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 0.11,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
