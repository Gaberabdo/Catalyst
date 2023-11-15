class Brand {
  String id;
  String admin;
  String name;
  BrandImage? image;

  Brand({
    required this.id,
    required this.admin,
    required this.name,
    required this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'],
      admin: json['admin'],
      name: json['name'],
      image: json['image'] == null ? null : BrandImage.fromJson(json['image']),
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
