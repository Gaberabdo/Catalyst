class CacheWeekModel {
  List<dynamic>? date;
  List<dynamic> listDoublepd;
  List<dynamic> listDoublept;
  List<dynamic> listDoublerh;

  CacheWeekModel({
    required this.date,
    required this.listDoublepd,
    required this.listDoublept,
    required this.listDoublerh,
  });

  // Convert the CacheModel object to a Map
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'listDoublepd': listDoublepd,
      'listDoublept': listDoublept,
      'listDoublerh': listDoublerh,
    };
  }

  // Create a CacheModel object from a Map
  factory CacheWeekModel.fromJson(Map<String, dynamic> json) {
    return CacheWeekModel(
      date: json['date'],
      listDoublepd:
          json['listDoublepd'].map((item) => item.toDouble()).toList(),
      listDoublept:
          json['listDoublept'].map((item) => item.toDouble()).toList(),
      listDoublerh:
          json['listDoublerh'].map((item) => item.toDouble()).toList(),
    );
  }
}
