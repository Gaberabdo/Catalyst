import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cat_price/features/conect%20us-feature/controller/cubit-connect.dart';
import 'package:cat_price/features/conect%20us-feature/controller/states-connect.dart';

import '../../../generated/l10n.dart';
import '../component/Text from-component.dart';

class ConnectUsScreen extends StatelessWidget {
  ConnectUsScreen({Key? key}) : super(key: key);
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectCubit(),
      child: BlocConsumer<ConnectCubit, ConnectStates>(
        listener: (context, state) {
          if (state is ConnectSucess) {
            Fluttertoast.showToast(
              msg: "Send Success to admin",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );

          }
        },
        builder: (context, state) {
          var cubit = ConnectCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              title: Text(
                S.of(context).connects,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).messageAdmin ,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: 327,
                            height: 301,
                            child: AlertDialog(
                              backgroundColor: Colors.white,
                              surfaceTintColor: Colors.white,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.86)),
                              title: Row(
                                children: [
                                  const Spacer(),
                                  Text(
                                    S.of(context).connects,
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
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
                                  Text(
                                    S.of(context).message,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  MyTextField(
                                    emailController: messageController,
                                    hintText: S.of(context).sendToAdmin,
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        cubit.SendConnect(
                                            message: messageController.text);
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color.fromRGBO(
                                            251, 200, 33, 1),
                                        onPrimary: Colors.white,
                                        elevation: 3,
                                        shape: (RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        )),
                                      ),
                                      child:  Text(
                                        S.of(context).save,
                                        style: TextStyle(fontFamily: 'medium'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        context: context,
                      );
                    },
                    child: Container(
                        height: 42,
                        width: 143,
                        decoration: BoxDecoration(
                            color: Colors.yellow.shade600,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            S.of(context).sendToAdmin,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.white),
                          ),
                        )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
