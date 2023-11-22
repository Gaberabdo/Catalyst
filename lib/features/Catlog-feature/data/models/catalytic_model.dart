class CatalyticModel {
  final String id;
  final String admin;
  final String name;
  final int v;

  CatalyticModel({
    required this.id,
    required this.admin,
    required this.name,
    required this.v,
  });

  factory CatalyticModel.fromJson(Map<String, dynamic> json) {
    return CatalyticModel(
      id: json['_id'],
      admin: json['admin'],
      name: json['name'],
      v: json['__v'],
    );
  }
}
