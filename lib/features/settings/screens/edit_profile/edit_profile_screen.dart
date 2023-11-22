import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:cat_price/features/settings/controller/setting_cubit.dart';
import 'package:cat_price/features/settings/controller/setting_state.dart';


import '../../../../core/core-brand/utiles/app_functions.dart';
import '../../../../generated/l10n.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  String userId = '';
  String companyName = '';
  String country = '';
  String type = '';
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit()..getUserData(),
      child: BlocConsumer<SettingCubit, SettingState>(
        listener: (context, state) {
          if (state is GetUserSuccess) {
            userId = state.brand.userData!.id!;
            companyName = state.brand.userData!.companyName!;
            country = state.brand.userData!.country!;
            type = state.brand.userData!.type!;
            nameController.text = state.brand.userData!.name!;
            phoneController.text = state.brand.userData!.phoneNumber!;
            emailController.text = state.brand.userData!.email!;
          }
          if (state is EditUserError) {
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
                S.of(context).editProfile,
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
                      S.of(context).FullName,
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
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Text(
                      S.of(context).Phone,
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
                          controller: phoneController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Phone';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Text(
                      S.of(context).Email,
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
                          controller: emailController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Email';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'individual',
                          activeColor: Color.fromRGBO(251, 200, 33, 1),
                          groupValue: cubit.selectedValue,
                          onChanged: (value) {
                            cubit.updateRadioValue(value!);
                          },
                        ),
                        const Text(
                          'Individual',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        Radio(
                          value: 'company',
                          activeColor: Color.fromRGBO(251, 200, 33, 1),
                          groupValue: cubit.selectedValue,
                          onChanged: (value) {
                            cubit.updateRadioValue(value!);
                          },
                        ),
                        const Text(
                          'Company',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        // Add more radio buttons as needed
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          cubit.editUser(
                            id: userId,
                            name: nameController.text,
                            email: emailController.text,
                            phoneNumber: phoneController.text,
                            country: country,
                            type: cubit.selectedValue,
                            companyName: companyName,
                          );

                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(8),
                          color: const Color.fromRGBO(251, 200, 33, 1),
                        ),
                        child: Center(
                          child: (state is EditUserLoading)
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  S.of(context).editProfile,
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
