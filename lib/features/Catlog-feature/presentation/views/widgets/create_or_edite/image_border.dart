import 'package:flutter/material.dart';

class ImageBorder extends StatelessWidget {
  const ImageBorder({Key? key, required this.imageWidget}) : super(key: key);

  final Widget imageWidget;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.17,
      child: imageWidget,
    );
  }
}
