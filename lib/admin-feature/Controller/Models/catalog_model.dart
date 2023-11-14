class CatalogModel {
  String? id;
  String? admin;
  String? name;
  String? details;
  int? weight;
  int? pd;
  int? pt;
  int? rh;
  int? price;
  String? brand;
  String? product;
  String? note;
  String? manufacturer;
  String? isHybrid;
  String? image;
  String? status;
  int? v;

  CatalogModel({
    required this.id,
    required this.admin,
    required this.name,
    required this.details,
    required this.weight,
    required this.pd,
    required this.pt,
    required this.rh,
    required this.price,
    required this.brand,
    required this.product,
    required this.note,
    required this.manufacturer,
    required this.isHybrid,
    required this.image,
    required this.status,
    required this.v,
  });

  factory CatalogModel.fromJson(Map<String, dynamic> json) {
    return CatalogModel(
      id: json['_id'] ?? 'no id',
      admin: json['admin'],
      name: json['name'],
      details: json['details'],
      weight: json['weight'],
      pd: json['pd'],
      pt: json['pt'],
      rh: json['rh'],
      price: json['price'],
      brand: json['brand'],
      product: json['product'],
      note: json['note'],
      manufacturer: json['manufacturer'],
      isHybrid: json['isHyprid'],
      image: json['image'].toString(),
      status: json['status'],
      v: json['__v'],
    );
  }
}
