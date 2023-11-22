import 'package:flutter/material.dart';

class ToolsItem extends StatelessWidget {
  const ToolsItem({super.key, required this.image, required this.text,required this.ontab});
final String image,text;
 final void Function()? ontab;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontab,
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor:const Color(0xFFF7F7F4),
            child: CircleAvatar(
              radius: 16,
              backgroundImage:AssetImage(image) ,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          )
        ],
      ),
    );
  }
}
