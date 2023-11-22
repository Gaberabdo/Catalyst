part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}

class LoadingItemsCategoryState extends CategoryState {}

class ErrorItemsCategoryState extends CategoryState {
  final String error;

  ErrorItemsCategoryState(this.error);
}

class SuccessItemsCategoryState extends CategoryState {
  final List<CatalogModel> value;

  SuccessItemsCategoryState(this.value);
}

class LoadingMyItemsCategoryState extends CategoryState {}

class ErrorMyItemsCategoryState extends CategoryState {
  final String error;

  ErrorMyItemsCategoryState(this.error);
}

class SuccessMyItemsCategoryState extends CategoryState {
  final List<CatalogModel> value;

  SuccessMyItemsCategoryState(this.value);
}

class LoadingSearchCategoryState extends CategoryState {}

class ErrorSearchCategoryState extends CategoryState {
  final String error;

  ErrorSearchCategoryState(this.error);
}

class SuccessSearchCategoryState extends CategoryState {
  final List<CatalogModel> value;

  SuccessSearchCategoryState(this.value);
}

class LoadingSearchMyItemsCategoryState extends CategoryState {}

class ErrorSearchMyItemsCategoryState extends CategoryState {
  final String error;

  ErrorSearchMyItemsCategoryState(this.error);
}

class SuccessSearchMyItemsCategoryState extends CategoryState {
  final List<CatalogModel> value;

  SuccessSearchMyItemsCategoryState(this.value);
}
