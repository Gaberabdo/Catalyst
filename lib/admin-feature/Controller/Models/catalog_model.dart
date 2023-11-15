class CatalogModel {
  CatalogModel({
    required this.success,
    required this.code,
    required this.catalogs,
  });
  late final bool success;
  late final int code;
  late final List<Catalogs> catalogs;

  CatalogModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    catalogs =
        List.from(json['catalogs']).map((e) => Catalogs.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['code'] = code;
    _data['catalogs'] = catalogs.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Catalogs {
  Catalogs({
    required this.id,
    this.userId,
    required this.name,
    required this.details,
    required this.weight,
    required this.pd,
    required this.pt,
    required this.rh,
    this.price,
    required this.brand,
    required this.product,
    required this.note,
    required this.manufacturer,
    required this.isHyprid,
    this.image,
    required this.status,
    required this.V,
  });
  late final String id;
  late final String? userId;
  late final String name;
  late final String details;
  late final int weight;
  late final int pd;
  late final int pt;
  late final int rh;
  late final int? price;
  late final String brand;
  late final String product;
  late final String note;
  late final String manufacturer;
  late final String isHyprid;
  late final dynamic? image;
  late final String? imageString;
  late final String status;
  late final int V;

  Catalogs.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userId = null;
    name = json['name'];
    details = json['details'];
    weight = json['weight'];
    pd = json['pd'];
    pt = json['pt'];
    rh = json['rh'];
    price = null;
    brand = json['brand'] ?? "None";
    product = json['product'] ?? 'None';
    note = json['note'];
    manufacturer = json['manufacturer'];
    isHyprid = json['isHyprid'];
    imageString = json['image'] is String ? json['image'] : null;
    image = json['image'] == null
        ? null
        : json['image'] is String
            ? json['image']
            : ImageModel.fromJson(json['image']);
    status = json['status'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['userId'] = userId;
    _data['name'] = name;
    _data['details'] = details;
    _data['weight'] = weight;
    _data['pd'] = pd;
    _data['pt'] = pt;
    _data['rh'] = rh;
    _data['price'] = price;
    _data['brand'] = brand;
    _data['product'] = product;
    _data['note'] = note;
    _data['manufacturer'] = manufacturer;
    _data['isHyprid'] = isHyprid;
    _data['image'] = image;
    _data['status'] = status;
    _data['__v'] = V;
    return _data;
  }
}

class UserId {
  UserId({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.isActive,
    required this.country,
    required this.type,
    required this.companyName,
    required this.role,
    required this.favListId,
    required this.V,
    required this.countryDiscount,
    required this.appDiscount,
    required this.hiddenDiscount,
    required this.pd,
    required this.pt,
    required this.rh,
  });
  late final String id;
  late final String name;
  late final String email;
  late final String password;
  late final String phoneNumber;
  late final bool isActive;
  late final String country;
  late final String type;
  late final String companyName;
  late final String role;
  late final String favListId;
  late final int V;
  late final int countryDiscount;
  late final int appDiscount;
  late final int hiddenDiscount;
  late final int pd;
  late final int pt;
  late final int rh;

  UserId.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    isActive = json['isActive'];
    country = json['country'];
    type = json['type'];
    companyName = json['companyName'];
    role = json['role'];
    favListId = json['favListId'];
    V = json['__v'];
    countryDiscount = json['countryDiscount'];
    appDiscount = json['appDiscount'];
    hiddenDiscount = json['hiddenDiscount'];
    pd = json['pd'];
    pt = json['pt'];
    rh = json['rh'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['password'] = password;
    _data['phoneNumber'] = phoneNumber;
    _data['isActive'] = isActive;
    _data['country'] = country;
    _data['type'] = type;
    _data['companyName'] = companyName;
    _data['role'] = role;
    _data['favListId'] = favListId;
    _data['__v'] = V;
    _data['countryDiscount'] = countryDiscount;
    _data['appDiscount'] = appDiscount;
    _data['hiddenDiscount'] = hiddenDiscount;
    _data['pd'] = pd;
    _data['pt'] = pt;
    _data['rh'] = rh;
    return _data;
  }
}

class ImageModel {
  ImageModel({
    required this.url,
    this.publicId,
  });
  late final String url;
  late final Null publicId;

  ImageModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    publicId = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['public_id'] = publicId;
    return _data;
  }
}
