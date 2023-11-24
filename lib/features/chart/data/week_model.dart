class WeekModel {
  final bool success;
  final int code;
  final List<double> pdHistory;
  final List<double> ptHistory;
  final List<double> rhHistory;

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
      pdHistory: (json['pdHistory'] as List)
          .map((e) => (e as num).toDouble())
          .toList(),
      ptHistory: (json['ptHistory'] as List)
          .map((e) => (e as num).toDouble())
          .toList(),
      rhHistory: (json['rhHistory'] as List)
          .map((e) => (e as num).toDouble())
          .toList(),
    );
  }
}
