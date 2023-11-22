
class MostSearchedModel {
  bool? success;
  int? code;
  List<Items>? items;

  MostSearchedModel({this.success, this.code, this.items});

  MostSearchedModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    code = json["code"];
    items = json["items"] == null ? null : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["code"] = code;
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Items {
  String? id;
  String? userId;
  String? name;
  dynamic price;
  dynamic weight;
  dynamic palladium;
  dynamic platinum;
  dynamic rhodium;
  Image? image;
  String? manufacturer;
  String? details;
  String? isHyprid;
  bool? isfavorite;
  dynamic searchCount;
  dynamic quantity;
  dynamic v;
  String? brand;
  String? product;

  Items({this.id, this.userId, this.name, this.price, this.weight, this.palladium, this.platinum, this.rhodium, this.image, this.manufacturer, this.details, this.isHyprid, this.isfavorite, this.searchCount, this.quantity, this.v, this.brand, this.product});

  Items.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    userId = json["userId"];
    name = json["name"];
    price = json["price"];
    weight = json["weight"];
    palladium = json["palladium"];
    platinum = json["platinum"];
    rhodium = json["rhodium"];
    image = json["image"] == null ? null : Image.fromJson(json["image"]);
    manufacturer = json["manufacturer"];
    details = json["details"];
    isHyprid = json["isHyprid"];
    isfavorite = json["isfavorite"];
    searchCount = json["searchCount"];
    quantity = json["quantity"];
    v = json["__v"];
    brand = json["brand"];
    product = json["product"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["userId"] = userId;
    _data["name"] = name;
    _data["price"] = price;
    _data["weight"] = weight;
    _data["palladium"] = palladium;
    _data["platinum"] = platinum;
    _data["rhodium"] = rhodium;
    if(image != null) {
      _data["image"] = image?.toJson();
    }
    _data["manufacturer"] = manufacturer;
    _data["details"] = details;
    _data["isHyprid"] = isHyprid;
    _data["isfavorite"] = isfavorite;
    _data["searchCount"] = searchCount;
    _data["quantity"] = quantity;
    _data["__v"] = v;
    _data["brand"] = brand;
    _data["product"] = product;
    return _data;
  }
}

class Image {
  NewImage? newImage;

  Image({this.newImage});

  Image.fromJson(Map<String, dynamic> json) {
    newImage = json["newImage"] == null ? null : NewImage.fromJson(json["newImage"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(newImage != null) {
      _data["newImage"] = newImage?.toJson();
    }
    return _data;
  }
}

class NewImage {
  String? url;
  String? publicId;

  NewImage({this.url, this.publicId});

  NewImage.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    publicId = json["public_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["public_id"] = publicId;
    return _data;
  }
}