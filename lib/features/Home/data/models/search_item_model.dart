class Item {
  final dynamic id;
  final dynamic userId;
  final dynamic name;
  final dynamic price;
  final dynamic brand;
  final dynamic? image; // Assuming image can be null
  bool? isFavorite;

  Item({
    required this.id,
    required this.userId,
    required this.name,
    required this.price,
    required this.brand,
    required this.image,
    this.isFavorite,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['_id'],
      userId: json['userId'],
      name: json['name'],
      price: json['price'].toDouble(),
      brand: json['brand'],
      image: json['image'] == null
          ? null
          : json['image'] is String
              ? json['image']
              : ImageDetails.fromJson(json['image']),
      isFavorite: json['isfavorite'],
    );
  }
}

class ImageDetails {
  final String url;
  final String publicId;

  ImageDetails({
    required this.url,
    required this.publicId,
  });

  factory ImageDetails.fromJson(Map<String, dynamic> json) {
    return ImageDetails(
      url: json['url'],
      publicId: json['public_id'],
    );
  }
}
