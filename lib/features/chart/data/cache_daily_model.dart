class CacheModelDaily {
  String? lastTime;
  List<dynamic> listDoubleXpdDaily;
  List<dynamic> listDoubleXptDaily;
  List<dynamic> listDoubleXrhDaily;
  List<String> times;

  CacheModelDaily(
      {required this.lastTime,
      required this.listDoubleXpdDaily,
      required this.listDoubleXptDaily,
      required this.listDoubleXrhDaily,
      required this.times});

  // Convert the CacheModel object to a Map
  Map<String, dynamic> toJson() {
    return {
      'lastTime': lastTime,
      'listDoubleXpdDaily': listDoubleXpdDaily,
      'listDoubleXptDaily': listDoubleXptDaily,
      'listDoubleXrhDaily': listDoubleXrhDaily,
      'times': times
    };
  }

  // Create a CacheModel object from a Map
  factory CacheModelDaily.fromJson(Map<String, dynamic> json) {
    return CacheModelDaily(
      lastTime: json['lastTime'],
      listDoubleXpdDaily:
          json['listDoubleXpdDaily'].map((item) => item.toDouble()).toList(),
      listDoubleXptDaily:
          json['listDoubleXptDaily'].map((item) => item.toDouble()).toList(),
      listDoubleXrhDaily:
          json['listDoubleXrhDaily'].map((item) => item.toDouble()).toList(),
      times: List<String>.from(json['times']),
    );
  }
}
