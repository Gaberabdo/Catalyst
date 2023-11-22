
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
import 'create_or_edite_item.dart';
import 'inbox_screen.dart';

class MyItemsScreen extends StatefulWidget {
  const MyItemsScreen({Key? key}) : super(key: key);

  @override
  State<MyItemsScreen> createState() => _MyItemsScreenState();
}

class _MyItemsScreenState extends State<MyItemsScreen> {
  late TextEditingController searchRefusedController;

  late TextEditingController searchPendingController;

  late TextEditingController searchApprovedController;

  @override
  void initState() {
    searchRefusedController = TextEditingController();
    searchPendingController = TextEditingController();
    searchApprovedController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    searchPendingController.dispose();
    searchRefusedController.dispose();
    searchApprovedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        CategoryCubit cubit = CategoryCubit.get(context);
        return DefaultTabController(
          length: 3, // Number of nested tabs
          child: Column(
            children: [
              TabBar(
                labelColor: AppColors.yellowColor,
                indicatorColor: AppColors.yellowColor,
                unselectedLabelColor: AppColors.grayColor,
                labelStyle: AppStyles.textStyle14,
                tabs: [
                  Tab(text: S.of(context).inProgress),
                  Tab(text: S.of(context).approved),
                  Tab(text: S.of(context).refused),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Content for Pending
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            ReusableTextFieldContainer(
                              hintText: S.of(context).search,
                              inputType: TextInputType.text,
                              controller: searchPendingController,
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  cubit.fetchMyItems(
                                      userId: AppVariables.userId,
                                      status: "pending");
                                } else {
                                  cubit.fetchSearchMyItems(
                                      userId: AppVariables.userId,
                                      text: value,
                                      status: "pending");
                                }
                              },
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.grayColor,
                                size: 32,
                              ),
                            ),
                            if (state is LoadingSearchMyItemsCategoryState) ...[
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
                            ] else if (CategoryCubit
                                .searchPendingMyItems.isEmpty) ...[
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
                                itemCount:
                                    CategoryCubit.searchPendingMyItems.length,
                                itemBuilder: (context, index) => MyItemsBuilder(
                                    model: CategoryCubit
                                        .searchPendingMyItems[index]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Content for Approved
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            ReusableTextFieldContainer(
                              hintText: S.of(context).search,
                              inputType: TextInputType.text,
                              controller: searchApprovedController,
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  cubit.fetchMyItems(
                                      userId: AppVariables.userId,
                                      status: "approved");
                                } else {
                                  cubit.fetchSearchMyItems(
                                      userId: AppVariables.userId,
                                      text: value,
                                      status: "approved");
                                }
                              },
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.grayColor,
                                size: 32,
                              ),
                            ),
                            if (state is LoadingSearchMyItemsCategoryState) ...[
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
                            ] else if (CategoryCubit
                                .searchApprovedMyItems.isEmpty) ...[
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
                                itemCount:
                                    CategoryCubit.searchApprovedMyItems.length,
                                itemBuilder: (context, index) => MyItemsBuilder(
                                  model: CategoryCubit
                                      .searchApprovedMyItems[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Content for Refused
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            ReusableTextFieldContainer(
                              hintText: S.of(context).search,
                              inputType: TextInputType.text,
                              controller: searchRefusedController,
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  cubit.fetchMyItems(
                                      userId: AppVariables.userId,
                                      status: "refused");
                                } else {
                                  cubit.fetchSearchMyItems(
                                      userId: AppVariables.userId,
                                      text: value,
                                      status: "refused");
                                }
                              },
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.grayColor,
                                size: 32,
                              ),
                            ),
                            if (state is LoadingSearchMyItemsCategoryState) ...[
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
                              ),
                            ] else if (CategoryCubit
                                .searchRefusedMyItems.isEmpty) ...[
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
                                itemCount:
                                    CategoryCubit.searchRefusedMyItems.length,
                                //reverse: true,
                                itemBuilder: (context, index) => MyItemsBuilder(
                                    model: CategoryCubit
                                        .searchRefusedMyItems[index]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MyItemsBuilder extends StatelessWidget {
  MyItemsBuilder({Key? key, required this.model}) : super(key: key);

  final CatalogModel model;

  String? brandImage;
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < AppVariables.brandList.length; i++) {
      if (AppVariables.brandList[i] == model.brand) {
        brandImage = AppVariables.brandsImage[i];
      }
    }
    print("model++++++++++++++++++++++++++++++++++++++++++++");
    print(model.id);
    //print(model.image['url']);
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
                    ),
                  ),
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
                            model.name ?? 'No Name',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppStyles.textStyle16,
                          ),
                        ),
                        if (model.note != "none") ...[
                          SizedBox(
                            width: 20,
                            height: 25,
                            child: InkWell(
                              onTap: () {
                                AppFunction.pushTo(
                                    context,
                                    InBoxScreen(
                                      note: model?.note,
                                      date:
                                          '${DateTime.now().day}\\${DateTime.now().month}\\${DateTime.now().year}',
                                    ));
                              },
                              child: Badge(
                                backgroundColor: Colors.red,
                                label: const Text("1"),
                                child: Icon(
                                  Icons.notifications_none,
                                  color: AppColors.grayColor,
                                ),
                              ),
                            ),
                          ),
                        ] else ...[
                          SizedBox(
                            width: 20,
                            height: 25,
                            child: InkWell(
                              onTap: () {
                                AppFunction.pushTo(
                                    context,
                                    InBoxScreen(
                                      note: model?.note,
                                      date:
                                          '${DateTime.now().day}\\${DateTime.now().month}\\${DateTime.now().year}',
                                    ));
                              },
                              child: Icon(
                                Icons.notifications_none,
                                color: AppColors.grayColor,
                              ),
                            ),
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
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              title: S.of(context).editeItem,
              fnc: () {
                print(model.image);
                AppFunction.pushTo(
                  context,
                  CreateOrEditeItem(
                    isEdite: true,
                    itemModel: model,
                    // categoryRepo: CategoryRepoImpl(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
