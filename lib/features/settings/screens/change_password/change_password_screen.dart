import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';

import 'package:cat_price/features/settings/controller/setting_cubit.dart';
import 'package:cat_price/features/settings/controller/setting_state.dart';

import '../../../../core/core-brand/utiles/app_functions.dart';
import '../../../../generated/l10n.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  var oldPassController = TextEditingController();
  var newPassController = TextEditingController();
  var conPassController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  String userId = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit()..getUserData(),
      child: BlocConsumer<SettingCubit, SettingState>(
        listener: (context, state) {
          if (state is GetUserSuccess) {
            userId = state.brand.userData!.id!;
          }
          if (state is ChangePasswordError) {
            AppFunction.showErrorORWarningDialog(
              context: context,
              subtitle: state.error,
              fct: () {},
            );
          }
        },
        builder: (context, state) {
          var cubit = SettingCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: const Color(0xffffffff),
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              title: Text(
                S.of(context).changePassword,
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
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).currentPassword,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10),
                        color: const Color.fromRGBO(247, 247, 244, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: oldPassController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: cubit.isPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter  Old Password';
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
                      height: 27,
                    ),
                    Text(
                      S.of(context).newPassword,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10),
                        color: const Color.fromRGBO(247, 247, 244, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: newPassController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: cubit.isNewPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter New Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Your New Password",
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {
                                cubit.changeNewPasswordVisibility();
                              },
                              icon: Icon(cubit.suffixNew),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Text(
                      S.of(context).confirmPassword,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10),
                        color: const Color.fromRGBO(247, 247, 244, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: conPassController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: cubit.isConPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Confirm Your Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Confirm Your Password",
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {
                                cubit.changeConPasswordVisibility();
                              },
                              icon: Icon(cubit.suffixCon),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          cubit.changePassword(
                            id: userId,
                            oldPassword: oldPassController.text,
                            newPassword: newPassController.text,
                            conPassword: conPassController.text,
                          ).then((value) {
                            Navigator.pop(context);
                          });
                        }
                      },
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(8),
                          color: const Color.fromRGBO(251, 200, 33, 1),
                        ),
                        child: Center(
                          child: (state is ChangePasswordLoading)
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  S.of(context).changePassword,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
