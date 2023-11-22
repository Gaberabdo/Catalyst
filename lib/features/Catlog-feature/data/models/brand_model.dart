class BrandModel {
  final String id;
  final String admin;
  final String name;
  final String details;
  final String? imageString;
  final dynamic? image;
  final String? publicId; // Optional field, as it can be null

  BrandModel({
    required this.id,
    required this.admin,
    required this.name,
    required this.details,
    required this.imageString,
    required this.image,
    this.publicId,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['_id'],
      admin: json['admin'],
      name: json['name'],
      details: json['details'],
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
