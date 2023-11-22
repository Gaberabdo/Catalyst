
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:cat_price/features/Authentication/presention/manager/Auth_cubit/cubit.dart';
import 'package:cat_price/features/Authentication/presention/manager/Auth_cubit/state.dart';
import 'package:cat_price/features/Authentication/presention/views/create_new_password_view.dart';

import 'Auth_button.dart';
import 'customTextField.dart';

class OtpBody extends StatefulWidget {
  const OtpBody({super.key});

  @override
  State<OtpBody> createState() => _OtpBodyState();
}
String? phone;

class _OtpBodyState extends State<OtpBody> {


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AuthCubit,AuthState>(
      listener: (context, state) {
        if(state is SuccessOtp){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateNewPasswordView(),));
        }
      },
      builder: (context, state) =>  SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            const  Text(
                'OTP Verification',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF010101),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
             const SizedBox(height: 10),
           const   Text(
                'Please check your email see the verification code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF9094A0),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
               const SizedBox(height: 40),
           const   Text(
                'OTP Code',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
             const SizedBox(
                height: 5,
              ),
              CustomTextField(onchanged: (p0) {
               phone=p0;
             },),
      const SizedBox(height: 30,),
              AuthButton(text: "Verify",
                ontab: () async{
      await BlocProvider.of<AuthCubit>(context).OtpCode(phone: phone!);
              },),
            ],
          ),
        ),
      ),
    );
  }
}
