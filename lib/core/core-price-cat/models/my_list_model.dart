

import 'package:cat_price/core/core-price-cat/models/search_model.dart';

class MyListModel {
  bool? success;
  int? code;
  List<Lists>? lists;

  MyListModel({this.success, this.code, this.lists});

  MyListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    if (json['lists'] != null) {
      lists = <Lists>[];
      json['lists'].forEach((v) {
        lists!.add(new Lists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    data['code'] = code;
    if (lists != null) {
      data['lists'] = lists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lists {
  String? sId;
  String? userId;
  String? listName;
  List<ListOfItems>? listOfItems;
  int? numOfItems;
  int? totalPrice;
  String? type;
  String? createdAt;
  int? iV;

  Lists(
      {this.sId,
        this.userId,
        this.listName,
        this.listOfItems,
        this.numOfItems,
        this.totalPrice,
        this.type,
        this.createdAt,
        this.iV});

  Lists.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    listName = json['listName'];
    if (json['listOfItems'] != null) {
      listOfItems = <ListOfItems>[];
      json['listOfItems'].forEach((v) {
        listOfItems!.add(new ListOfItems.fromJson(v));
      });
    }
    numOfItems = json['numOfItems'];
    totalPrice = json['totalPrice'];
    type = json['type'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['userId'] = userId;
    data['listName'] = listName;
    if (listOfItems != null) {
      data['listOfItems'] = listOfItems!.map((v) => v.toJson()).toList();
    }
    data['numOfItems'] = numOfItems;
    data['totalPrice'] = totalPrice;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['__v'] = iV;
    return data;
  }
}

class ListOfItems {
  Id? iId;
  int? quantity;
  int? price;

  ListOfItems({this.iId, this.quantity, this.price});

  ListOfItems.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (iId != null) {
      data['_id'] = iId!.toJson();
    }
    data['quantity'] = quantity;
    data['price'] = price;
    return data;
  }
}

class Id {
  String? sId;
  String? userId;
  String? name;
  int? price;
  int? weight;
  int? palladium;
  int? platinum;
  int? rhodium;
  Image2? image;
  String? manufacturer;
  String? details;
  String? isHyprid;
  bool? isfavorite;
  int? searchCount;
  int? quantity;
  int? iV;

  Id(
      {this.sId,
        this.userId,
        this.name,
        this.price,
        this.weight,
        this.palladium,
        this.platinum,
        this.rhodium,
        this.image,
        this.manufacturer,
        this.details,
        this.isHyprid,
        this.isfavorite,
        this.searchCount,
        this.quantity,
        this.iV});

  Id.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    name = json['name'];
    price = json['price'];
    weight = json['weight'];
    palladium = json['palladium'];
    platinum = json['platinum'];
    rhodium = json['rhodium'];
    image = json['image'] != null ? Image2.fromJson(json['image']) : null;
    manufacturer = json['manufacturer'];
    details = json['details'];
    isHyprid = json['isHyprid'];
    isfavorite = json['isfavorite'];
    searchCount = json['searchCount'];
    quantity = json['quantity'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['userId'] = userId;
    data['name'] = name;
    data['price'] = price;
    data['weight'] = weight;
    data['palladium'] = palladium;
    data['platinum'] = platinum;
    data['rhodium'] = rhodium;
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
    return data;
  }
}

