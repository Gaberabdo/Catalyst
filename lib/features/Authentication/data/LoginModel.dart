
class LoginModel {
  bool? success;
  String? token;
  int? code;
  UserData? userData;

  LoginModel({this.success, this.token, this.code, this.userData});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    token = json["token"];
    code = json["code"];
    userData = json["userData"] == null ? null : UserData.fromJson(json["userData"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["success"] = success;
    data["token"] = token;
    data["code"] = code;
    if(userData != null) {
      data["userData"] = userData?.toJson();
    }
    return data;
  }
}

class UserData {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  bool? isActive;
  String? country;
  String? type;
  String? companyName;
  int? appDiscount;
  int? countryDiscount;
  int? hiddenDiscount;
  Plan? plan;
  String? role;
  dynamic favListId;
  int? v;
  int? pd;
  int? pt;
  int? rh;

  UserData({this.id, this.name, this.email, this.phoneNumber, this.isActive, this.country, this.type, this.companyName, this.appDiscount, this.countryDiscount, this.hiddenDiscount, this.plan, this.role, this.favListId, this.v, this.pd, this.pt, this.rh});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    email = json["email"];
    phoneNumber = json["phoneNumber"];
    isActive = json["isActive"];
    country = json["country"];
    type = json["type"];
    companyName = json["companyName"];
    appDiscount = json["appDiscount"];
    countryDiscount = json["countryDiscount"];
    hiddenDiscount = json["hiddenDiscount"];
    plan = json["plan"] == null ? null : Plan.fromJson(json["plan"]);
    role = json["role"];
    favListId = json["favListId"];
    v = json["__v"];
    pd = json["pd"];
    pt = json["pt"];
    rh = json["rh"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["name"] = name;
    data["email"] = email;
    data["phoneNumber"] = phoneNumber;
    data["isActive"] = isActive;
    data["country"] = country;
    data["type"] = type;
    data["companyName"] = companyName;
    data["appDiscount"] = appDiscount;
    data["countryDiscount"] = countryDiscount;
    data["hiddenDiscount"] = hiddenDiscount;
    if(plan != null) {
      data["plan"] = plan?.toJson();
    }
    data["role"] = role;
    data["favListId"] = favListId;
    data["__v"] = v;
    data["pd"] = pd;
    data["pt"] = pt;
    data["rh"] = rh;
    return data;
  }
}

class Plan {
  bool? caculator;
  bool? totalPrice;
  bool? userDiscount;
  bool? catalog;

  Plan({this.caculator, this.totalPrice, this.userDiscount, this.catalog});

  Plan.fromJson(Map<String, dynamic> json) {
    caculator = json["caculator"];
    totalPrice = json["totalPrice"];
    userDiscount = json["userDiscount"];
    catalog = json["catalog"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["caculator"] = caculator;
    data["totalPrice"] = totalPrice;
    data["userDiscount"] = userDiscount;
    data["catalog"] = catalog;
    return data;
  }
}