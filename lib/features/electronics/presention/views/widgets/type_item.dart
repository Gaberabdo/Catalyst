import 'package:flutter/material.dart';

import '../product_list_view.dart';
import 'electronics_body.dart';

class TypeItem extends StatelessWidget {
  const TypeItem({
    Key? key,
    required this.imageName,
    required this.title,
    required this.type,
  }) : super(key: key);
  final String imageName;
  final String title;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 10,
              blurRadius: 30,
              // changes position of shadow
            ),
          ]),
      child: ListTile(
        minLeadingWidth: 50,
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: arrowbgColor,
            borderRadius: BorderRadius.circular(15),
            // shape: BoxShape.circle
          ),
          child: Center(
            child: Image.asset(imageName),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductListView(title: title, type: type),
          ));
        },
      ),
    );
  }
}
