import 'package:flutter/material.dart';

import 'Auth_button.dart';
import 'customTextField.dart';


class CreateNewPasswordBody extends StatefulWidget {
  const CreateNewPasswordBody({super.key});

  @override
  State<CreateNewPasswordBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<CreateNewPasswordBody> {
  GlobalKey<FormState>formkey=GlobalKey();
  TextEditingController? newPasswordController;
  TextEditingController? confrimPasswordController;
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    newPasswordController?.dispose();
    confrimPasswordController?.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:  Form(
          key: formkey,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 120,),
              const Center(
                child: Text(
                  'Create new Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF010101),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Center(
                child: SizedBox(
                  width: 300,
                  child: Text(
                    'Your new password must be different from previous used password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF9094A0),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              const  Text(
                'New Password',
                style: TextStyle(
                  color: Color(0xFF010101),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              // CustomFormTextField(label: "email",onchanged: (p0) {
              //
              // }, ),
              const SizedBox(height: 20),
              const  Text(
                'Confirm Password',
                style: TextStyle(
                  color: Color(0xFF010101),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(hinttext: "Enter Your Password",onchanged: (value) {

              }, ),
             const SizedBox(height: 40),
              AuthButton(text: "Reset Password",ontab: () {
                if(formkey.currentState!.validate()){

                }else{
                  autovalidateMode=AutovalidateMode.always;
                  setState(() {

                  });
                }
              },),



            ],
          ),
        ),
      ),
    );
  }
}
