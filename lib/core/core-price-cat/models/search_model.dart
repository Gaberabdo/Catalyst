class SearchModel {
  bool? success;
  int? code;
  List<Items>? items;

  SearchModel({this.success, this.code, this.items});

  SearchModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? sId;
  String? userId;
  String? name;
  int? price;
  int? weight;
  int? palladium;
  int? platinum;
  int? rhodium;
  String? brand;
  Image2? image;
  String? manufacturer;
  String? details;
  String? isHyprid;
  bool? isfavorite;
  int? searchCount;
  int? quantity;
  int? iV;
  String? catalyticProduct;
  String? product;

  Items(
      {this.sId,
        this.userId,
        this.name,
        this.price,
        this.weight,
        this.palladium,
        this.platinum,
        this.rhodium,
        this.brand,
        this.image,
        this.manufacturer,
        this.details,
        this.isHyprid,
        this.isfavorite,
        this.searchCount,
        this.quantity,
        this.iV,
        this.catalyticProduct,
        this.product});

  Items.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    name = json['name'];
    price = json['price'];
    weight = json['weight'];
    palladium = json['palladium'];
    platinum = json['platinum'];
    rhodium = json['rhodium'];
    brand = json['brand'];
    image = json['image'] != null ? Image2.fromJson(json['image']) : null;
    manufacturer = json['manufacturer'];
    details = json['details'];
    isHyprid = json['isHyprid'];
    isfavorite = json['isfavorite'];
    searchCount = json['searchCount'];
    quantity = json['quantity'];
    iV = json['__v'];
    catalyticProduct = json['catalyticProduct'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userId'] = userId;
    data['name'] = name;
    data['price'] = price;
    data['weight'] = weight;
    data['palladium'] = palladium;
    data['platinum'] = platinum;
    data['rhodium'] = rhodium;
    data['brand'] = brand;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['manufacturer'] = manufacturer;
    data['details'] = details;
    data['isHyprid'] = isHyprid;
    data['isfavorite'] = isfavorite;
    data['searchCount'] = searchCount;
    data['quantity'] = quantity;
    data['__v'] = iV;
    data['catalyticProduct'] = catalyticProduct;
    data['product'] = product;
    return data;
  }
}

class Image2 {
  String? url;

  Image2({this.url});

  Image2.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}