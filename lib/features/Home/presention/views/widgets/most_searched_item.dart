import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_price/features/Home/data/models/most_searched_model.dart';

import '../../manager/metals_cubit/cubit.dart';
import '../../manager/metals_cubit/state.dart';

class MostSearchedItem extends StatelessWidget {
  const MostSearchedItem({
    super.key, required this.items,
  });
  final Items items;
  @override
  Widget build(BuildContext context) {
    dynamic image;
    dynamic brand;
    brand=items.brand??"Brand manufacture";
    image=items.image?.newImage?.url??"http://res.cloudinary.com/dvltpsxv9/image/upload/v1699949474/items/8888.jpg";
    return BlocBuilder<MetalsCubit, MetalsState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: 327,
          height: 118,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 10,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 76,
                height: 94,
                decoration: ShapeDecoration(
                  image:  DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              const SizedBox(width: 8),
               SizedBox(
                height: 83,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 149,
                          child: Text(
                            items.name!,
                            style: const TextStyle(
                              color: Color(0xFF110317),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                       const SizedBox(height: 10),
                        SizedBox(
                          width: 59,
                          child: Text(
                            '${items.price.toStringAsFixed(2)}\$',
                            style: const TextStyle(
                              color: Color(0xFFFBC821),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                       const SizedBox(height: 10),
                        SizedBox(
                          width: 149,
                          child: Text(
                            brand,
                            style: const TextStyle(
                              color: Color(0xFF9094A0),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
