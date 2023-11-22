class ProductModel {
  final String id;
  final String admin;
  final String name;
  final int v;

  ProductModel({
    required this.id,
    required this.admin,
    required this.name,
    required this.v,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      admin: json['admin'],
      name: json['name'],
      v: json['__v'],
    );
  }
}
