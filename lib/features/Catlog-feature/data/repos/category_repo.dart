import 'package:cat_price/features/Catlog-feature/data/models/brand_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/core-brand/errors/failures.dart';
import '../models/catalog_model.dart';
import '../models/catalytic_model.dart';
import '../models/product_model.dart';

abstract class CategoryRepo {
  Future<Either<Failure, List<BrandModel>>> fetchBrands();
  Future<Either<Failure, List<ProductModel>>> fetchProduct();
  Future<Either<Failure, List<CatalyticModel>>> fetchCatalytic();
  Future<Either<Failure, List<CatalogModel>>> fetchCatalog(
      {String? userId, String? status});
  Future<Either<Failure, List<CatalogModel>>> fetchSearchItems({
    required String text,
    String? status,
    String? userId,
  });

  Future<Either<Failure, bool>> updateItems({
    required String itemId,
    required String name,
    required int weight,
    required String details,
    required int rh,
    required int pt,
    required int pd,
    required String price,
    required String brand,
    required String product,
    required String manufacturer,
    required String isHyprid,
  });
}
