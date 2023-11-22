
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:get/get.dart';
import 'package:cat_price/features/Authentication/presention/manager/Auth_cubit/cubit.dart';
import 'package:cat_price/features/Authentication/presention/manager/Auth_cubit/state.dart';
import 'package:cat_price/features/Authentication/presention/views/otp_view.dart';

import 'Auth_button.dart';
import 'customTextField.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<ForgetPasswordBody> {
  GlobalKey<FormState>formkey=GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  String? phone;



  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AuthCubit,AuthState>(
      listener: (context, state) {
        if(state is SuccessOtp){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>const OtpView(),));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:  Form(
              key: formkey,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 90,),
                  const Center(
                    child: Text(
                      'Forgot password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF010101),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Center(
                    child: SizedBox(
                      width: 300 ,
                      child: Text(
                        'Enter your Phone Number to reset your password',
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
                    'Phone',
                    style: TextStyle(
                      color: Color(0xFF010101),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(hinttext: "Enter Your Phone Number",onchanged: (p0) {
                    phone=p0;
                  }, ),
                  const SizedBox(height: 50),
                  AuthButton(text: "Send",ontab: () async{
                    if(formkey.currentState!.validate()){
                      await BlocProvider.of<AuthCubit>(context).OtpCode(phone: phone!);
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
      });

  }
}
