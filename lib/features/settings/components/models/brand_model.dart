class Brand {
  late final String? id;
  late final String? admin;
  late final String? details;
  late final String? name;
  late final dynamic? v;
  late final BrandImage? image;
  late final String? imageString;

  Brand({
    this.id,
    this.admin,
    this.name,
    this.details,
    this.imageString,
    this.image,
    this.v,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'],
      admin: json['admin'],
      v: json['__v'],
      details: json['details'],
      name: json['name'],
      imageString : json['image'] is String ? json['image'] : null,
      image : json['image'] == null
          ? null
          : json['image'] is String
          ? json['image']
          : BrandImage.fromJson(json['image']),
    );
  }
}

class BrandImage {
  String url;
  String? publicId;

  BrandImage({
    required this.url,
    this.publicId,
  });

  factory BrandImage.fromJson(Map<String, dynamic> json) {
    return BrandImage(
      url: json['url'],
      publicId: json['public_id'],
    );
  }
}

class BrandResponse {
  bool success;
  int code;
  List<Brand> brands;

  BrandResponse({
    required this.success,
    required this.code,
    required this.brands,
  });

  factory BrandResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> brandsJson = json['brands'];
    List<Brand> brands =
        brandsJson.map((brandJson) => Brand.fromJson(brandJson)).toList();

    return BrandResponse(
      success: json['success'],
      code: json['code'],
      brands: brands,
    );
  }
}
