class WeekModel {
  bool success;
  int code;
  List<double> pdHistory;
  List<double> ptHistory;
  List<double> rhHistory;

  WeekModel({
    required this.success,
    required this.code,
    required this.pdHistory,
    required this.ptHistory,
    required this.rhHistory,
  });

  factory WeekModel.fromJson(Map<String, dynamic> json) {
    return WeekModel(
      success: json['success'],
      code: json['code'],
      pdHistory: List<double>.from(json['pdHistory']),
      ptHistory: List<double>.from(json['ptHistory']),
      rhHistory: List<double>.from(json['rhHistory']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'code': code,
      'pdHistory': pdHistory,
      'ptHistory': ptHistory,
      'rhHistory': rhHistory,
    };
  }
}
