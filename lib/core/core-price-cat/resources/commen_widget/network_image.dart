import 'package:flutter/material.dart';

import '../color_manager.dart';

Widget getImageFromNetwork(
    {
      required String path,
      double width=60,
      double height=60,
    }
    ){
  return Image(
      height: height,
      width: width,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(
            color: ColorManager.primary,
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) =>
       Icon(Icons.error,size: 50,color: ColorManager.primary,),
      image:  NetworkImage(path));
}