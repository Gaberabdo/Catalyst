import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/cat-price-feature/controller/cubit/price_list_cubit/price_cubit.dart';
import '../../models/search_model.dart';
import '../assets_manager.dart';
import '../color_manager.dart';
import '../value_manager.dart';
import 'network_image.dart';

Widget itemList({required Items model, required int index}) {
  return BlocConsumer<PriceCubit, PriceState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      var cubit = PriceCubit.get(context);
      return Card(
        elevation: 0,
        color: ColorManager.white,
        margin: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadiusDirectional.all(Radius.circular(5)),
                child: getImageFromNetwork(
                    path: (model.image != null)
                        ? model.image!.url.toString()
                        : ''),
              ),
              const SizedBox(
                width: AppSize.s12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.name.toString()),
                    const SizedBox(
                      height: AppSize.s8,
                    ),
                    Text(
                      model.price.toString(),
                      style: TextStyle(color: ColorManager.primary),
                    ),
                    const SizedBox(
                      height: AppSize.s8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Expanded(
                          child: Text(
                            'quantity',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            cubit.decreaseQuantity(index: index);
                          },
                          child: Container(
                            height: 20,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadiusDirectional.all(
                                  Radius.circular(5)),
                              border: Border.all(
                                  color: ColorManager.primary, width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ImageIcon(
                                  const AssetImage(IconAssets.minimizeIcon),
                                  color: ColorManager.primary),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: AppSize.s4,
                        ),
                        Text(
                          model.quantity.toString(),
                          style: TextStyle(color: ColorManager.primary),
                        ),
                        const SizedBox(
                          width: AppSize.s4,
                        ),
                        InkWell(
                          onTap: () {
                            cubit.increaseQuantity(index: index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadiusDirectional.all(
                                    Radius.circular(5)),
                                color: ColorManager.primary),
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: ColorManager.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
