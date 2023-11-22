
import 'package:cat_price/features/Catlog-feature/presentation/views/view_product.dart';
import 'package:cat_price/features/Catlog-feature/presentation/views/widgets/custom_button.dart';
import 'package:cat_price/features/Catlog-feature/presentation/views/widgets/reusable_textfield.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/core-brand/utiles/app_functions.dart';
import '../../../../core/core-brand/utiles/app_variables.dart';
import '../../../../core/core-brand/utiles/assets_manager.dart';
import '../../../../core/core-brand/utiles/colors.dart';
import '../../../../core/core-brand/utiles/stayles.dart';
import '../../../../core/core-brand/utiles/widgets/error_body.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/catalog_model.dart';
import '../controller/category_cubit/category_cubit.dart';
import '../../../../generated/l10n.dart';

class ViewProduct extends StatelessWidget {
  const ViewProduct({Key? key, required this.model, required this.flag})
      : super(key: key);

  final CatalogModel model;
  final String? flag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: model.image?['url'] == null
                    ? BoxDecoration(
                        image: DecorationImage(
                        image: AssetImage(AssetsManager.defaultImageUrl),
                        fit: BoxFit.cover,
                      ))
                    : BoxDecoration(
                        image: DecorationImage(
                        image: NetworkImage(model.image!['url']),
                        fit: BoxFit.cover,
                      )),
              ),
              Text(
                "CAT PRICE",
                style: AppStyles.textStyle40.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.grey[400]?.withOpacity(0.5)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: AppStyles.textStyle18,
                ),
                Container(
                  width: 54,
                  height: 1.5,
                  color: AppColors.yellowColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Brand Name",
                      style: AppStyles.textStyle16
                          .copyWith(color: AppColors.grayColor),
                    ),
                    const Spacer(),
                    Text(
                      model.name == "" || model.name == null
                          ? "No Name"
                          : model.name.toString(),
                      style: AppStyles.textStyle16
                          .copyWith(color: AppColors.grayColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      model.weight.toString(),
                      style: AppStyles.textStyle16,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        if (model.userId?["country"] != null) ...[
                          Text(
                            flag!,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ] else ...[
                          Image.asset(
                            AssetsManager.flagIcon,
                            width: 20,
                          ),
                        ],
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          model.userId?["country"] ?? "No Country",
                          style: AppStyles.textStyle14,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Boysen",
                      style: AppStyles.textStyle16,
                    ),
                    const Spacer(),
                    Text("${model.isHybrid}", style: AppStyles.textStyle14),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      S.of(context).price,
                      style: AppStyles.textStyle16,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "${AppFunction.priceCalculate(
                        pd: model.pd.toString(),
                        pt: model.pt.toString(),
                        rh: model.rh.toString(),
                        weight: model.weight!.toDouble(),
                      )}\$",
                      style: AppStyles.textStyle16
                          .copyWith(color: AppColors.yellowColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  S.of(context).itemDetails,
                  style: AppStyles.textStyle16,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  model.details ?? "No details",
                  textAlign: TextAlign.left,
                  style: AppStyles.textStyle12
                      .copyWith(color: AppColors.grayColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
