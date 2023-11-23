class BrandModel {
  final String id;
  final String admin;
  final String name;
  final String details;
  final Map<String, dynamic>? imageUrl;
  final String? publicId; // Optional field, as it can be null

  BrandModel({
    required this.id,
    required this.admin,
    required this.name,
    required this.details,
    required this.imageUrl,
    this.publicId,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['_id'],
      admin: json['admin'],
      name: json['name'],
      details: json['details'],
      imageUrl:
      json['image'] is String ? {'url': json['image']} : json['image'],
      publicId: json['image']['public_id'],
    );
  }
}
