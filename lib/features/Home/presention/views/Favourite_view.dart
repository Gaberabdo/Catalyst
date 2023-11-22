import 'package:flutter/material.dart';
import 'package:cat_price/features/Home/presention/views/widgets/favourite_body.dart';
import 'package:cat_price/generated/l10n.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text(
          S.of(context).Favourite,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: const FavouriteBody(),
    );
  }
}
