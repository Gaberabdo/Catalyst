
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart 'as bloc;
import 'package:get/get.dart';
import 'package:cat_price/features/Authentication/presention/manager/Auth_cubit/state.dart';
import 'package:cat_price/generated/l10n.dart';

import '../../../../conect us-feature/component/Text from-component.dart';
import '../../manager/Auth_cubit/cubit.dart';
import '../sigin_in_view.dart';
import 'Auth_button.dart';
import 'customTextField.dart';

class SignUpBody extends StatefulWidget {
  const  SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignUpBody> {

  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? email;
  String? name;
  String? phone;
  String? password;
  String? countryName;

  var countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bloc.BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SuccessSignUp) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInView(),
            ),
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
                  height: 90,
                ),
                Center(
                  child: Text(
                    S.of(context).Signup,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF010101),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  S.of(context).FullName,
                  style: const TextStyle(
                    color: Color(0xFF010101),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hinttext: S.of(context).FullName,
                  onchanged: (p0) {
                    name = p0;
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).Phone,
                  style: const TextStyle(
                    color: Color(0xFF010101),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hinttext: S.of(context).EnterYourPhoneNumber,
                  phone: true,
                  onchanged: (p0) {
                    phone = p0;
                  },
                ),
                const SizedBox(height: 20),
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
                  onchanged: (p0) {
                    email = p0;
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
                  onchanged: (p0) {
                    password = p0;
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).Country,
                  style: const TextStyle(
                    color: Color(0xFF010101),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  hintText: S.of(context).SelectYourCountry,
                  emailController: countryController,
                  onChanged: (p0) {
                    countryName = p0;
                    setState(() {});
                  },
                  suffixIcon: IconButton(
                    icon: Icon(Icons.keyboard_arrow_down_sharp),
                    onPressed: () {
                      showCountryPicker(
                        context: context,
                        useSafeArea: true,
                        showPhoneCode:
                            true, // optional. Shows phone code before the country name.
                        onSelect: (Country country) {
                          countryName = country.name.toString();
                          countryController.text = country.name.toString();
                          setState(() {});
                          print('Select country: ${country.displayName}');
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                ConditionalBuilder(
                  condition: state is! LoadingSignUp,
                  builder: (context) => AuthButton(
                      text: S.of(context).Signup,
                      ontab: () async {
                        if (formkey.currentState!.validate()) {
                          await bloc.BlocProvider.of<AuthCubit>(context).SignUp(
                            password: password!,
                            email: email!,
                            name: name!,
                            phone: phone!,
                            country: countryName!,
                          );
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      }),
                  fallback: (context) => const Center(
                      child:
                          CircularProgressIndicator(color: Color(0xFF010101))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).Alreadyhaveanaccount,
                      style: const TextStyle(
                        color: Color(0xFF010101),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 0.11,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const SignInView(),
                            transition: Transition.leftToRight,
                            duration: const Duration(milliseconds: 400));
                      },
                      child: Text(
                        S.of(context).Signin,
                        style: const TextStyle(
                          color: Color(0xFFFBC821),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 0.11,
                        ),
                      ),
                    ),
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
