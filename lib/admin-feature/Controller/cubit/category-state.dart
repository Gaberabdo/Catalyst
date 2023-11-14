import 'package:admin_task/admin-feature/Controller/Models/product_model.dart';

import '../Models/brand_model.dart';

abstract class CategoryState {}

class HomeInial extends CategoryState {}

class HomeLoading extends CategoryState {}

class HomeSucess extends CategoryState {}

class HomeErorr extends CategoryState {}

class UpdateLoading extends CategoryState {}

class UpdateSucess extends CategoryState {}

class UpdataErorr extends CategoryState {}

class GetBrandLoading extends CategoryState {}

class GetBrandSuccess extends CategoryState {
  List<Brand> brand = [];

  GetBrandSuccess(this.brand);
}

class GetBrandError extends CategoryState {}

class GetProductLoading extends CategoryState {}

class GetProductSuccess extends CategoryState {
  List<ProductModel> brand = [];

  GetProductSuccess(this.brand);
}

class GetProductError extends CategoryState {}

class RequestAdminStateLoading extends CategoryState {}

class RequestAdminStateLSuccess extends CategoryState {}

class RequestAdminStateError extends CategoryState {}

class DeleteCatalogLoading extends CategoryState {}

class DeleteCatalogSuccess extends CategoryState {}

class DeleteCatalogError extends CategoryState {}
