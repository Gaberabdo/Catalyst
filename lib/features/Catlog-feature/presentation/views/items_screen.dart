
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

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is SuccessSearchCategoryState) {
        } else if (state is ErrorSearchCategoryState) {
          ErrorBody(errorMessage: state.error);
        } else if (state is LoadingSearchCategoryState) {
          Center(
            child: CircularProgressIndicator(
              color: AppColors.yellowColor,
            ),
          );
        }
      },
      builder: (context, state) {
        CategoryCubit cubit = CategoryCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              ReusableTextFieldContainer(
                hintText: S.of(context).search,
                inputType: TextInputType.text,
                controller: searchTextController,
                onChanged: (value) {
                  if (value.isEmpty) {
                    cubit.fetchItems(/*status: "approved"*/);
                  } else {
                    cubit.fetchSearchItems(text: value);
                  }
                },
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.grayColor,
                  size: 32,
                ),
              ),
              if (state is LoadingSearchCategoryState) ...[
                Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: CircularProgressIndicator(
                        color: AppColors.yellowColor,
                      ),
                    ),
                  ],
                )
              ] else if (CategoryCubit.searchItems.isEmpty) ...[
                Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                        child: Text(
                      S.of(context).noResult,
                      style: AppStyles.textStyle30,
                    )),
                  ],
                ),
              ],
              Expanded(
                  child: ListView.builder(
                itemCount: CategoryCubit.searchItems.length,
                itemBuilder: (context, index) => ItemBuilder(
                  model: CategoryCubit.searchItems[index],
                ),
              )),
            ],
          ),
        );
      },
    );
  }
}

class ItemBuilder extends StatelessWidget {
  ItemBuilder({Key? key, required this.model}) : super(key: key);

  final CatalogModel model;

  String? brandImage;
  @override
  Widget build(BuildContext context) {
    CountryService countryService = CountryService();
    String? setEmoji() {
      print(model.userId?["country"]);
      final country = countryService.findByName(model.userId?["country"]);
      print(country?.flagEmoji);
      return country?.flagEmoji;
    }

    for (int i = 0; i < AppVariables.brandList.length; i++) {
      if (AppVariables.brandList[i] == model.brand) {
        brandImage = AppVariables.brandsImage[i];
      }
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.28,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (model.image?["url"] != null) ...[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.network(
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.22,
                            height: MediaQuery.of(context).size.height * 0.15,
                            model.image!["url"]!.toString(),
                          ),
                          Text(
                            "CAT PRICE",
                            style: AppStyles.textStyle16.copyWith(
                                fontWeight: FontWeight.w800,
                                color: Colors.grey[400]?.withOpacity(0.5)),
                          ),
                        ],
                      )),
                ] else ...[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.asset(
                            AssetsManager.defaultImageUrl,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.22,
                            height: MediaQuery.of(context).size.height * 0.15,
                          ),
                          Text(
                            "CAT PRICE",
                            style: AppStyles.textStyle16.copyWith(
                                fontWeight: FontWeight.w800,
                                color: Colors.grey[400]?.withOpacity(0.5)),
                          ),
                        ],
                      )),
                ],
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.514,
                          child: Text(
                            model.name ?? 'Product Name',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppStyles.textStyle16,
                          ),
                        ),
                        if (model.userId?["country"] != null) ...[
                          Text(
                            setEmoji()!,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ] else ...[
                          Image.asset(
                            AssetsManager.flagIcon,
                            width: 20,
                          ),
                        ],
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Text(
                      "${AppFunction.priceCalculate(
                        pd: model.pd.toString(),
                        pt: model.pt.toString(),
                        rh: model.rh.toString(),
                        weight: model.weight!.toDouble(),
                      )}\$",
                      style: AppStyles.textStyle14
                          .copyWith(color: AppColors.yellowColor),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.57,
                      child: Row(
                        children: [
                          Text(
                            S.of(context).brand,
                            style: AppStyles.textStyle12
                                .copyWith(color: AppColors.grayColor),
                          ),
                          const Spacer(),
                          if (brandImage != null) ...[
                            Image.network(
                              brandImage!,
                              width: 20,
                            ),
                          ] else ...[
                            Image.asset(
                              AssetsManager.logoIcon,
                              width: 20,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomButton(
              title: S.of(context).view,
              fnc: () {
                AppFunction.pushTo(
                    context, ViewProduct(model: model, flag: setEmoji()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
