import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:google_fonts/google_fonts.dart';
import 'package:cat_price/features/inbox-feature/controller/cubit/inbox-cubit.dart';
import 'package:cat_price/features/inbox-feature/controller/cubit/inbox-state.dart';

import '../../../generated/l10n.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InboxCubit()..getInbox(),
      child: BlocConsumer<InboxCubit, InboxStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = InboxCubit.get(context);

          if (state is InboxLoading) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  S.of(context).Inbox,
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
              ),
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow.shade600,
                ),
              ),
            );
          } else if (state is InboxSucess) {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  elevation: 0,
                  title: Text(
                    S.of(context).Inbox,
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                ),
                body: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${cubit.brandsJson[index]}'),
                        ),
                      ),
                    );
                  },
                  shrinkWrap: true,
                  itemCount: cubit.brandsJson.length,
                ));
          } else {
            return Center(child: Text('Check Data '));
          }
        },
      ),
    );
  }
}
