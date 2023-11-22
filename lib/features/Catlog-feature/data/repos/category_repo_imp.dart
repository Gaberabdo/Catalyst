import 'package:cat_price/core/core-brand/utiles/app_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/core-brand/errors/failures.dart';

import '../../../../core/core-brand/utiles/api_const.dart';
import '../../../../core/core-brand/utiles/api_service.dart';
import '../models/brand_model.dart';
import '../models/catalog_model.dart';
import '../models/catalytic_model.dart';
import '../models/product_model.dart';
import 'category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  @override
  Future<Either<Failure, List<BrandModel>>> fetchBrands() async {
    try {
      Response response = await DioHelper.getData(
        url: "${ApiConst.baseUrl}admin/brand/list",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
          },
        ),
      ); // Replace with your API endpoint

      print("+++++++++++++response++++++++++++++");
      print(response.data["brands"]);

      List<dynamic> brandsJson = response.data['brands'];

      List<BrandModel> brandsList = await brandsJson.map((json) => BrandModel.fromJson(json)).toList();

      print("+++++++++++++brandsList++++++++++++++");
      print(brandsList[0].name);
      return right(brandsList);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> fetchProduct() async {
    try {
      Response response = await DioHelper.getData(
        url: "${ApiConst.baseUrl}admin/product/list",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
          },
        ),
      ); // Replace with your API endpoint

      print("+++++++++++++response++++++++++++++");
      print(response.data["products"]);

      List<dynamic> brandsJson = response.data['products'];

      List<ProductModel> productsList =
          await brandsJson.map((json) => ProductModel.fromJson(json)).toList();

      print("+++++++++++++productsList++++++++++++++");
      print(productsList[0].name);
      return right(productsList);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CatalyticModel>>> fetchCatalytic() async {
    try {
      Response response = await DioHelper.getData(
        url: "${ApiConst.baseUrl}admin/catalytic/list",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
          },
        ),
      ); // Replace with your API endpoint

      print("+++++++++++++response++++++++++++++");
      print(response.data["catalytics"]);

      List<dynamic> brandsJson = response.data['catalytics'];

      List<CatalyticModel> catalytic = await brandsJson
          .map((json) => CatalyticModel.fromJson(json))
          .toList();

      print("+++++++++++++catalytic++++++++++++++");
      print(catalytic[0].name);
      return right(catalytic);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, UploadImageModel>> uploadImage({
  //   required String itemId,
  //   required File imageFile,
  // }) async {
  //   try {
  //     String fileName = imageFile.path.split('/').last;
  //     FormData formData = FormData.fromMap({
  //       'image':
  //           await MultipartFile.fromFile(imageFile.path, filename: fileName),
  //     });
  //
  //     Response response = await DioHelper.postData(
  //       url: "${ApiConst.baseUrl}user/catalog/image",
  //       data: formData,
  //       queryParameters: {
  //         "_id": itemId,
  //       },
  //       options: Options(
  //         sendTimeout: 6000,
  //         //receiveDataWhenStatusError: true,
  //         receiveTimeout: 6000, // 5 seconds
  //         headers: {
  //           'Authorization':
  //               'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTM2ZGZlNGIwNDdmYjFjYjMzOGE3NWMiLCJuYW1lIjoiWW91c3NlZiBRYXRyeSIsImVtYWlsIjoieW91c2VmcWF0cnkyMDAyQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk4MTQ3NzkyLCJleHAiOjE3Mjk2ODM3OTJ9.d3HGPahRS7ZdMASpzpZM5I-NJ-1q25ycxSktscEAvMY',
  //         },
  //       ),
  //     );
  //
  //     print("+++++++++++++response image++++++++++++++");
  //     print(response.statusCode);
  //     print("+++++++++++++response image++++++++++++++");
  //     print(response);
  //
  //     UploadImageModel image = UploadImageModel.fromJson(response.data);
  //     return right(image);
  //   } on DioError catch (e) {
  //     print("e.toString()");
  //     print(e.toString());
  //     return left(ServerFailure(e.toString()));
  //   }
  // }

  @override
  Future<Either<ServerFailure, List<CatalogModel>>> fetchCatalog({
    String? userId,
    String? status,
  }) async {
    try {
      if (userId != null && status != null) {
        Response response = await DioHelper.getData(
            url: "${ApiConst.baseUrl}user/catalog/list",
            options: Options(
              headers: {
                'Authorization':
                    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTM2ZGZlNGIwNDdmYjFjYjMzOGE3NWMiLCJuYW1lIjoiWW91c3NlZiBRYXRyeSIsImVtYWlsIjoieW91c2VmcWF0cnkyMDAyQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk4MTQ3NzkyLCJleHAiOjE3Mjk2ODM3OTJ9.d3HGPahRS7ZdMASpzpZM5I-NJ-1q25ycxSktscEAvMY',
              },
            ),
            queryParameters: {
              "userId": "$userId",
              "status": "$status",
            });

        print("/////////////////response.data//////////////////");
        print(response.data);
        List<dynamic> brandsJson = response.data['catalogs'];
        List<CatalogModel> catalogs = await brandsJson
            .map((json) => CatalogModel.fromJson(json))
            .toList();
        print("+++++++++++++catalogs++++++++++++++");
        return right(catalogs);
      } else if (userId == null && status != null) {
        Response response = await DioHelper.getData(
            url: "${ApiConst.baseUrl}user/catalog/list",
            options: Options(
              headers: {
                'Authorization':
                    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTM2ZGZlNGIwNDdmYjFjYjMzOGE3NWMiLCJuYW1lIjoiWW91c3NlZiBRYXRyeSIsImVtYWlsIjoieW91c2VmcWF0cnkyMDAyQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk4MTQ3NzkyLCJleHAiOjE3Mjk2ODM3OTJ9.d3HGPahRS7ZdMASpzpZM5I-NJ-1q25ycxSktscEAvMY',
              },
            ),
            queryParameters: {
              "status": status,
            });
        List<dynamic> brandsJson = response.data['catalogs'];
        List<CatalogModel> catalogs = await brandsJson
            .map((json) => CatalogModel.fromJson(json))
            .toList();
        print("+++++++++++++catalogs++++++++++++++");
        return right(catalogs);
      } else {
        Response response = await DioHelper.getData(
          url: "${ApiConst.baseUrl}user/catalog/list",
          options: Options(
            headers: {
              'Authorization':
                  'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTM2ZGZlNGIwNDdmYjFjYjMzOGE3NWMiLCJuYW1lIjoiWW91c3NlZiBRYXRyeSIsImVtYWlsIjoieW91c2VmcWF0cnkyMDAyQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk4MTQ3NzkyLCJleHAiOjE3Mjk2ODM3OTJ9.d3HGPahRS7ZdMASpzpZM5I-NJ-1q25ycxSktscEAvMY',
            },
          ),
        );
        List<dynamic> brandsJson = response.data['catalogs'];
        List<CatalogModel> catalogs = await brandsJson
            .map((json) => CatalogModel.fromJson(json))
            .toList();
        print("+++++++++++++catalogs++++++++++++++");
        return right(catalogs);
      }
    } on Exception catch (e) {
      if (e is DioError) {
        print("DioError: ${e.message}");
        print("DioError type: ${e.type}");
        print("DioError response: ${e.response}");
        return left(ServerFailure.fromDioError(e));
      }
      print("Exception: ${e}");
      print("Exception type: ${e}");
      print("Exception response: ${e}");
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CatalogModel>>> fetchSearchItems({
    required String text,
    String? status,
    String? userId,
  }) async {
    try {
      if (status == null && userId == null) {
        Response response = await DioHelper.getData(
            url: "${ApiConst.baseUrl}user/catalog/search",
            options: Options(
              headers: {
                'Authorization':
                    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTM2ZGZlNGIwNDdmYjFjYjMzOGE3NWMiLCJuYW1lIjoiWW91c3NlZiBRYXRyeSIsImVtYWlsIjoieW91c2VmcWF0cnkyMDAyQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk4MTQ3NzkyLCJleHAiOjE3Mjk2ODM3OTJ9.d3HGPahRS7ZdMASpzpZM5I-NJ-1q25ycxSktscEAvMY',
              },
            ),
            queryParameters: {
              "searchTerm": text,
            }); // Replace with your API endpoint

        print("+++++++++++++response++++++++++++++");
        print(response.data["catalogs"]);

        List<dynamic> brandsJson = response.data['catalogs'];

        List<CatalogModel> catalogs = await brandsJson
            .map((json) => CatalogModel.fromJson(json))
            .toList();

        print("+++++++++++++search++++++++++++++");
        return right(catalogs);
      } else {
        Response response = await DioHelper.getData(
            url: "${ApiConst.baseUrl}user/catalog/search",
            options: Options(
              headers: {
                'Authorization':
                    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTM2ZGZlNGIwNDdmYjFjYjMzOGE3NWMiLCJuYW1lIjoiWW91c3NlZiBRYXRyeSIsImVtYWlsIjoieW91c2VmcWF0cnkyMDAyQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk4MTQ3NzkyLCJleHAiOjE3Mjk2ODM3OTJ9.d3HGPahRS7ZdMASpzpZM5I-NJ-1q25ycxSktscEAvMY',
              },
            ),
            queryParameters: {
              "searchTerm": text,
              "status": status,
              "userId": userId,
            }); // Replace with your API endpoint

        print("+++++++++++++response++++++++++++++");
        print(response.data["catalogs"]);

        List<dynamic> brandsJson = response.data['catalogs'];

        List<CatalogModel> catalogs = await brandsJson
            .map((json) => CatalogModel.fromJson(json))
            .toList();

        print("+++++++++++++search++++++++++++++");
        return right(catalogs);
      }
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CatalogModel>> createItems({
    required String userId,
    required String name,
    required int weight,
    required String details,
    required String manufacturer,
    required int rh,
    required int pt,
    required int pd,
    required context,
  }) async {
    try {
      Response response = await DioHelper.postData(
        url: "${ApiConst.baseUrl}user/catalog/create",
        data: {
          "userId": userId,
          "name": name,
          "weight": weight,
          "details": details,
          "manufacturer": manufacturer,
          "rh": rh,
          "pt": pt,
          "pd": pd
        },
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTM5NjEzNjI5ODgyZjUyYWM0MzIwMjkiLCJuYW1lIjoiTW9oYW1lZCBBbGkiLCJlbWFpbCI6Im1vZWxzbW9raHJhdHlAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE2OTg0NDk0MzksImV4cCI6MTcwMTA0MTQzOX0.l24wfkFclIEbFlWQDQTkz_m6wSNf7tOvVOqSON_Q3jk',
          },
        ),
      );

      print("+++++++++++++Response Status Code++++++++++++++");
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("+++++++++++++Response Message++++++++++++++");
        print(response.data["message"]);

        Map<String, dynamic> catalogJson = response.data['catalog'];

        CatalogModel catalog = CatalogModel.fromJson(catalogJson);

        print("+++++++++++++Catalogs++++++++++++++");
        print(catalog);
        return right(catalog);
      } else {
        return left(ServerFailure("HTTP Status Error: ${response.statusCode}"));
      }
    } on DioError catch (e) {
      if (e.response != null) {
        await AppFunction.showErrorORWarningDialog(
          context: context,
          subtitle: "An error has been occured $e",
          fct: () {},
        );
        return left(ServerFailure(e.toString()));
        print("DioError ${e.response?.statusCode}: ${e.response?.data}");
      } else {
        return left(ServerFailure.fromDioError(e));
        // Something went wrong while sending the request
        print("DioError: ${e.message}");
      }
    }
  }

  @override
  Future<Either<Failure, bool>> updateItems({
     String? itemId,
     String? name,
     int? weight,
     String ?details,
     int? rh,
     int? pt,
     int? pd,
     String? price,
     String? brand,
     String ?product,
     String? manufacturer,
     String? isHyprid,
  }) async {
    try {
      Response response = await DioHelper.putData(
        url: "${ApiConst.baseUrl}user/catalog/update",
        data: {
          "name": name,
          "weight": weight,
          "details": details,
          "rh": rh,
          "pt": pt,
          "pd": pd,
          "price": price,
          "brand": brand,
          "product": product,
          "manufacturer": manufacturer,
          "isHyprid": isHyprid,
        },
        queryParameters: {
          "_id": itemId,
        },
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTM2ZGZlNGIwNDdmYjFjYjMzOGE3NWMiLCJuYW1lIjoiWW91c3NlZiBRYXRyeSIsImVtYWlsIjoieW91c2VmcWF0cnkyMDAyQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk4MTQ3NzkyLCJleHAiOjE3Mjk2ODM3OTJ9.d3HGPahRS7ZdMASpzpZM5I-NJ-1q25ycxSktscEAvMY',
          },
        ),
      );

      print("+++++++++++++Response Status Code++++++++++++++");
      print(response.statusCode);

      if (response.statusCode == 200) {
        print("+++++++++++++update Message++++++++++++++");
        print(response.data["success"]);

        bool catalogsJson = response.data['success'];

        bool catalogs = catalogsJson;

        print("+++++++++++++update++++++++++++++");
        print(catalogs);
        return right(catalogs);
      } else {
        print("+++++++++++++Error Response++++++++++++++");
        print(response.data);
        return left(ServerFailure("HTTP Status Error: ${response.statusCode}"));
      }
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
