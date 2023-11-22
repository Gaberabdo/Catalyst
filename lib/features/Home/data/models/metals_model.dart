class MetalsModel{
  bool? success;
  int? code;
  Metal? metal;

  MetalsModel({this.success, this.code, this.metal});

  MetalsModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    code = json["code"];
    metal = json["metal"] == null ? null : Metal.fromJson(json["metal"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["success"] = success;
    data["code"] = code;
    if(metal != null) {
      data["metal"] = metal?.toJson();
    }
    return data;
  }
}

class Metal {
  String? id;
  int? pd;
  int? pt;
  int? rh;
  String? date;
  int? v;

  Metal({this.id, this.pd, this.pt, this.rh, this.date, this.v});

  Metal.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    pd = json["pd"];
    pt = json["pt"];
    rh = json["rh"];
    date = json["date"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["pd"] = pd;
    data["pt"] = pt;
    data["rh"] = rh;
    data["date"] = date;
    data["__v"] = v;
    return data;
  }
}