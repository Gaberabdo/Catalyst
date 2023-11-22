
import 'package:cat_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/core-brand/utiles/app_functions.dart';
import '../../../../core/core-brand/utiles/app_variables.dart';
import '../../../../core/core-brand/utiles/colors.dart';
import '../../../../core/core-brand/utiles/service_locator.dart';
import '../../../../core/core-brand/utiles/stayles.dart';
import '../../data/repos/category_repo_imp.dart';
import '../controller/category_cubit/category_cubit.dart';
import 'create_or_edite_item.dart';
import 'items_screen.dart';
import 'my_items_screen.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double iconAppbar = 28;
    return BlocProvider(
      create: (context) => CategoryCubit(
        getIt.get<CategoryRepoImpl>(),
      )
        ..fetchItems(/*status: "approved"*/)
        ..fetchCreateOrEditeValues()
        ..fetchMyItems(userId: AppVariables.userId, status: "approved")
        ..fetchMyItems(userId: AppVariables.userId, status: "pending")
        ..fetchMyItems(userId: AppVariables.userId, status: "refused"),
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: Text(
                  S.of(context).title,
                  style: AppStyles.textStyle18,
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      AppFunction.pushTo(
                        context,
                        const CreateOrEditeItem(
                          isEdite: false,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.add,
                      color: AppColors.yellowColor,
                      size: iconAppbar,
                    ),
                  ),
                ],
                bottom: TabBar(
                  labelColor: AppColors.yellowColor,
                  indicatorColor: AppColors.yellowColor,
                  unselectedLabelColor: AppColors.grayColor,
                  labelStyle: AppStyles.textStyle16,
                  tabs: [
                    Tab(
                      text: S.of(context).items,
                    ),
                    Tab(text: S.of(context).myItems),
                  ],
                ),
              ),
              body: const TabBarView(
                children: [
                  ItemsScreen(),
                  MyItemsScreen(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
