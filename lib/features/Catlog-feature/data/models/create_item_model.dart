class CreateItemModel {
  final bool success;
  final int code;
  final CatalogData catalog;
  final String message;

  CreateItemModel({
    required this.success,
    required this.code,
    required this.catalog,
    required this.message,
  });

  factory CreateItemModel.fromJson(Map<String, dynamic> json) {
    return CreateItemModel(
      success: json['success'],
      code: json['code'],
      catalog: CatalogData.fromJson(json['catalog']),
      message: json['message'],
    );
  }
}

class CatalogData {
  final String id;
  final String? userId;
  final String name;
  final String details;
  final int weight;
  final int pd;
  final int pt;
  final int rh;
  final double price;
  final String brand;
  final String product;
  final String note;
  final String manufacturer;
  final String isHybrid;
  final String? image;
  final String status;
  final int v;

  CatalogData({
    required this.id,
    required this.userId,
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

  factory CatalogData.fromJson(Map<String, dynamic> json) {
    return CatalogData(
      id: json['_id'],
      userId: json['userId'],
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
      image: json['image'],
      status: json['status'],
      v: json['__v'],
    );
  }
}
