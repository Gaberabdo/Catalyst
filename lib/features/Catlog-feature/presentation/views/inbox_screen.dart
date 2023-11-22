
import 'package:flutter/material.dart';

import '../../../../core/core-brand/utiles/colors.dart';
import '../../../../core/core-brand/utiles/stayles.dart';
import '../../../../generated/l10n.dart';

class InBoxScreen extends StatelessWidget {
  const InBoxScreen({Key? key, required this.note, required this.date})
      : super(key: key);

  final String? note;
  final String? date;
  @override
  Widget build(BuildContext context) {
    if (note == "none") {
      return Scaffold(
        appBar: inBoxAppBar(context, 28),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      // boxShadow: [BoxShadow(blurRadius: 0.1, spreadRadius: 0.1)],
                      ),
                  child: Text(
                    "No Notes yet",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: AppStyles.textStyle20,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: inBoxAppBar(context, 28),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      // boxShadow: [BoxShadow(blurRadius: 0.1, spreadRadius: 0.1)],
                      ),
                  child: Text(
                    note!,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: AppStyles.textStyle14,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Text(
                  date ?? "",
                  style: AppStyles.textStyle12
                      .copyWith(color: AppColors.grayColor),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

AppBar inBoxAppBar(BuildContext context, double iconAppbar) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.keyboard_arrow_left,
        color: Colors.black,
        size: iconAppbar,
      ),
    ),
    title: Text(
      S.of(context).Inbox,
      style: AppStyles.textStyle18,
    ),
    centerTitle: true,
  );
}
