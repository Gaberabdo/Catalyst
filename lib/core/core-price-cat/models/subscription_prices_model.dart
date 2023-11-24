class SubscriptionPrices {
  bool? success;
  int? code;
  List<Prices>? prices;

  SubscriptionPrices({this.success, this.code, this.prices});

  SubscriptionPrices.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add(Prices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    if (prices != null) {
      data['prices'] = prices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Prices {
  String? sId;
  String? subscriptionType;
  Month? month;
  Month? year;
  int? totalMonthlyPrice;
  int? totalYearlyPrice;
  int? iV;

  Prices(
      {this.sId,
        this.subscriptionType,
        this.month,
        this.year,
        this.totalMonthlyPrice,
        this.totalYearlyPrice,
        this.iV});

  Prices.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    subscriptionType = json['subscriptionType'];
    month = json['month'] != null ? Month.fromJson(json['month']) : null;
    year = json['year'] != null ? Month.fromJson(json['year']) : null;
    totalMonthlyPrice = json['totalMonthlyPrice'];
    totalYearlyPrice = json['totalYearlyPrice'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['subscriptionType'] = subscriptionType;
    if (month != null) {
      data['month'] = month!.toJson();
    }
    if (year != null) {
      data['year'] = year!.toJson();
    }
    data['totalMonthlyPrice'] = totalMonthlyPrice;
    data['totalYearlyPrice'] = totalYearlyPrice;
    data['__v'] = iV;
    return data;
  }
}

class Month {
  FullSearch? fullSearch;
  Users? users;
  int? calculator;
  int? priceList;
  int? myCatalog;

  Month(
      {this.fullSearch,
        this.users,
        this.calculator,
        this.priceList,
        this.myCatalog});

  Month.fromJson(Map<String, dynamic> json) {
    fullSearch = json['fullSearch'] != null
        ? FullSearch.fromJson(json['fullSearch'])
        : null;
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
    calculator = json['calculator'];
    priceList = json['priceList'];
    myCatalog = json['myCatalog'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fullSearch != null) {
      data['fullSearch'] = fullSearch!.toJson();
    }
    if (users != null) {
      data['users'] = users!.toJson();
    }
    data['calculator'] = calculator;
    data['priceList'] = priceList;
    data['myCatalog'] = myCatalog;
    return data;
  }
}

class FullSearch {
  int? firstNum;
  int? firstNumCost;
  int? secondNum;
  int? secondNumCost;
  int? thirdNum;
  int? thirdNumCost;
  int? fourthNum;
  int? fourthNumCost;

  FullSearch(
      {this.firstNum,
        this.firstNumCost,
        this.secondNum,
        this.secondNumCost,
        this.thirdNum,
        this.thirdNumCost,
        this.fourthNum,
        this.fourthNumCost});

  FullSearch.fromJson(Map<String, dynamic> json) {
    firstNum = json['firstNum'];
    firstNumCost = json['firstNumCost'];
    secondNum = json['secondNum'];
    secondNumCost = json['secondNumCost'];
    thirdNum = json['thirdNum'];
    thirdNumCost = json['thirdNumCost'];
    fourthNum = json['fourthNum'];
    fourthNumCost = json['fourthNumCost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstNum'] = firstNum;
    data['firstNumCost'] = firstNumCost;
    data['secondNum'] = secondNum;
    data['secondNumCost'] = secondNumCost;
    data['thirdNum'] = thirdNum;
    data['thirdNumCost'] = thirdNumCost;
    data['fourthNum'] = fourthNum;
    data['fourthNumCost'] = fourthNumCost;
    return data;
  }
}

class Users {
  int? oneUser;
  int? twoUsers;
  int? threeUsers;

  Users({this.oneUser, this.twoUsers, this.threeUsers});

  Users.fromJson(Map<String, dynamic> json) {
    oneUser = json['oneUser'];
    twoUsers = json['twoUsers'];
    threeUsers = json['threeUsers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['oneUser'] = oneUser;
    data['twoUsers'] = twoUsers;
    data['threeUsers'] = threeUsers;
    return data;
  }
}
