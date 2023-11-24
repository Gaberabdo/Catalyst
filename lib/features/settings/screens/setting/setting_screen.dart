import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:google_fonts/google_fonts.dart';
import 'package:cat_price/features/Authentication/presention/views/sigin_in_view.dart';
import 'package:cat_price/features/settings/controller/setting_cubit.dart';
import 'package:cat_price/features/settings/controller/setting_state.dart';
import 'package:cat_price/features/settings/screens/change_password/change_password_screen.dart';

import '../../../../core/SharedPreference.dart';

import '../../../../core/core-brand/utiles/app_functions.dart';
import '../../../../generated/l10n.dart';
import '../edit_profile/edit_profile_screen.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  var passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = SettingCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: const Color(0xffffffff),
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0,
            title: Text(
              S.of(context).Settings,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                Text(
                  S.of(context).language,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Row(
                  children: [
                    MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        cubit.changeAppLang(
                          langMode: "en",
                        );
                      },
                      child: Row(
                        children: [
                          Radio(
                            value: 'en',
                            groupValue: cubit.language,
                            activeColor: const Color(0xffFBC821),
                            onChanged: (value) {

                            },
                          ),
                          const Text(
                            'English',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        cubit.changeAppLang(
                          langMode: "ar",
                        );
                      },
                      child: Row(
                        children: [
                          Radio(
                            value: 'ar',
                            groupValue: cubit.language,
                            activeColor: const Color(0xffFBC821),
                            onChanged: (value) {
                              cubit.changeAppLang(
                                langMode: "ar",
                              );
                              print(cubit.language);
                            },
                          ),
                          const Text(
                            'Arabic',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer()
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      S.of(context).currency,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 50,
                      width: MediaQuery.sizeOf(context).width * .5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10),
                          color: const Color.fromRGBO(247, 247, 244, 1)),
                      child: const Center(
                        child: Text(
                          'USD',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return EditProfileScreen();
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        S.of(context).editProfile,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ChangePasswordScreen();
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        S.of(context).changePassword,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      S.of(context).discountMargin,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 50,
                      width: MediaQuery.sizeOf(context).width * .5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10),
                          color: const Color.fromRGBO(247, 247, 244, 1)),
                      child: const Center(
                        child: Text(
                          '0',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          surfaceTintColor: Colors.white,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.86)),
                          title: Row(
                            children: [
                              const Spacer(),
                              Text(
                                S.of(context).deleteAccount,
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.close),
                              )
                            ],
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10),
                                  color:
                                      const Color.fromRGBO(247, 247, 244, 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: passController,
                                    keyboardType:
                                        TextInputType.visiblePassword,
                                    obscureText: cubit.isPassword,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter  Current Password';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Current Password",
                                      errorBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          cubit.changeOldPasswordVisibility();
                                        },
                                        icon: Icon(cubit.suffix),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (passController.text.isEmpty) {
                                      AppFunction.showErrorORWarningDialog(
                                        context: context,
                                        subtitle: 'Add Your Note Please',
                                        fct: () {},
                                      );
                                    } else {
                                      cubit
                                          .deleteAccount(
                                        id: Preference.getData(key: "userId"),
                                        password: passController.text,
                                      )
                                          .then((value) {
                                        Preference.deleteData(key: 'token');
                                        Preference.deleteData(key: 'userId');
                                        Preference.deleteData(key: 'name');
                                        Preference.deleteData(key: 'email');
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return SignInView();
                                            },
                                          ),
                                          (route) => false,
                                        );
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(227, 29, 28, 1),
                                    onPrimary: Colors.white,
                                    elevation: 3,
                                    shape: (RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                  ),
                                  child: Text(
                                    S.of(context).deleteAccount,
                                    style: TextStyle(fontFamily: 'medium'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    S.of(context).deleteAccount,
                    style: const TextStyle(
                      color: Color.fromRGBO(227, 29, 28, 1),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
