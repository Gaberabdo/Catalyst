
import 'package:cat_price/core/core-brand/utiles/app_variables.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/catalog_model.dart';
import '../../../data/repos/category_repo.dart';
import '../../../data/repos/category_repo_imp.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepo) : super(CategoryInitialState());

  static CategoryCubit get(context) => BlocProvider.of(context);
  final CategoryRepo categoryRepo;

  Future<void> fetchItems({String? status}) async {
    emit(LoadingItemsCategoryState());
    var result = await categoryRepo.fetchCatalog(
      status: status,
    );
    result.fold((failure) {
      emit(ErrorItemsCategoryState(failure.message));
    }, (value) {
      searchItems = value;
      emit(SuccessItemsCategoryState(value));
    });
  }

  static List<CatalogModel> searchPendingMyItems = [];
  static List<CatalogModel> searchApprovedMyItems = [];
  static List<CatalogModel> searchRefusedMyItems = [];

  Future<void> fetchMyItems({
    required String userId,
    String? status,
  }) async {
    emit(LoadingMyItemsCategoryState());
    var result = await categoryRepo.fetchCatalog(
      status: status,
      userId: userId,
    );

    result.fold((failure) {
      emit(ErrorMyItemsCategoryState(failure.message));
    }, (value) {
      if (status == 'approved') {
        searchApprovedMyItems = value;
        print("searchApprovedMyItems");
        print(searchApprovedMyItems);
      } else if (status == 'pending') {
        searchPendingMyItems = value;
        print("searchPendingMyItems");
        print(searchPendingMyItems);
      } else if (status == 'refused') {
        searchRefusedMyItems = value;
        print("searchRefusedMyItems");
        print(searchRefusedMyItems);
      }
      emit(SuccessMyItemsCategoryState(value));
    });
  }

  static List<CatalogModel> searchItems = [];

  Future<void> fetchSearchItems({required String text}) async {
    emit(LoadingSearchCategoryState());
    var result = await categoryRepo.fetchSearchItems(
      text: text,
    );

    result.fold((failure) {
      emit(ErrorSearchCategoryState(failure.message));
    }, (value) {
      searchItems = value;
      print("+++++++++searchItems++++++++++");
      print(searchItems);
      emit(SuccessSearchCategoryState(value));
    });
  }

  Future<void> fetchSearchMyItems({
    required String text,
    required String status,
    required String userId,
  }) async {
    emit(LoadingSearchMyItemsCategoryState());
    var result = await categoryRepo.fetchSearchItems(
      text: text,
      status: status,
      userId: userId,
    );

    result.fold((failure) {
      emit(ErrorSearchMyItemsCategoryState(failure.message));
    }, (value) {
      if (status == 'approved') {
        searchApprovedMyItems = value;
        print("searchApprovedMyItems");
        print(searchApprovedMyItems);
      } else if (status == 'pending') {
        searchPendingMyItems = value;
        print("searchPendingMyItems");
        print(searchPendingMyItems);
      } else if (status == 'refused') {
        searchRefusedMyItems = value;
        print("searchRefusedMyItems");
        print(searchRefusedMyItems);
      }
      emit(SuccessSearchMyItemsCategoryState(value));
    });
  }

  Future<void> fetchCreateOrEditeValues() async {
    AppVariables.brandList.clear();
    CategoryRepoImpl().fetchBrands().then((value) {
      value.fold((l) {}, (r) {
        for (int i = 0; i < r.length; i++) {
          AppVariables.brandsImage.add(r[i].image.imageUrl?['url']);
          AppVariables.brandList.add(r[i].name);
        }
        print("AppVariables.brandsImage +++++++");
        print(AppVariables.brandsImage);
      });
      print("++brandList++");
      print(AppVariables.brandList);
    });
    CategoryRepoImpl().fetchProduct().then((value) {
      AppVariables.productList.clear();
      value.fold((l) {}, (r) {
        for (int i = 0; i < r.length; i++) {
          AppVariables.productList.add(r[i].name);
        }
      });
      print("++productList++");
      print(AppVariables.productList);
    });
    CategoryRepoImpl().fetchCatalytic().then((value) {
      AppVariables.catalyticList.clear();
      value.fold((l) {}, (r) {
        for (int i = 0; i < r.length; i++) {
          AppVariables.catalyticList.add(r[i].name);
        }
      });
      print("++catalyticList++");
      print(AppVariables.catalyticList);
    });
  }
}
