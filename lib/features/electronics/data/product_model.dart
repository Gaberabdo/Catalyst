class ProductData {
  bool success;
  int code;
  List<Product> items;

  ProductData({
    required this.success,
    required this.code,
    required this.items,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      success: json['success'],
      code: json['code'],
      items: List<Product>.from(
          json['Items'].map((item) => Product.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'code': code,
      'Items': items.map((item) => item.toJson()).toList(),
    };
  }
}

class Product {
  String name;
  double price;
  String? image;
  // String manufacturer;
  Product({
    required this.name,
    required this.price,
    this.image,
    //required this.manufacturer,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: double.parse(json['price'].toStringAsFixed(4)).toDouble(),
      image: json['image'],
      // manufacturer: json['manufacturer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      // 'manufacturer': manufacturer,
    };
  }
}
