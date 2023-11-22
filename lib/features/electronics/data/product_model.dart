class ProductData {
  final bool success;
  final int code;
  final List<Product> items;

  ProductData({
    required this.success,
    required this.code,
    required this.items,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      success: json['success'],
      code: json['code'],
      items: (json['Items'] as List)
          .map((itemJson) => Product.fromJson(itemJson))
          .toList(),
    );
  }
}

class Product {
  final String name;
  final double price;
  final Image? image;

  Product({
    required this.name,
    required this.price,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: double.parse(json['price'].toStringAsFixed(4)).toDouble(),
      image: json['image'] != null ? Image.fromJson(json['image']) : null,
    );
  }
}

class Image {
  final String url;
  final String publicId;

  Image({
    required this.url,
    required this.publicId,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      url: json['url'],
      publicId: json['public_id'],
    );
  }
}
