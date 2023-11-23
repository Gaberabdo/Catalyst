class MetalData {
  bool success;
  int code;
  Metal metal;

  MetalData({
    required this.success,
    required this.code,
    required this.metal,
  });

  factory MetalData.fromJson(Map<String, dynamic> json) {
    return MetalData(
      success: json['success'],
      code: json['code'],
      metal: Metal.fromJson(json['metal']),
    );
  }
}

class Metal {
  List<double> pdDaily;
  List<double> ptDaily;
  List<double> rhDaily;
  List<String> date;

  Metal({
    required this.pdDaily,
    required this.ptDaily,
    required this.rhDaily,
    required this.date,
  });

  factory Metal.fromJson(Map<String, dynamic> json) {
    return Metal(
      pdDaily:
          (json['pdDaily'] as List).map((e) => (e as num).toDouble()).toList(),
      ptDaily:
          (json['ptDaily'] as List).map((e) => (e as num).toDouble()).toList(),
      rhDaily:
          (json['rhDaily'] as List).map((e) => (e as num).toDouble()).toList(),
      date: List<String>.from(json['date'].map((dateString) {
        DateTime dateTime = DateTime.parse(dateString);
        return '${dateTime.hour}:${dateTime.minute}';
      })),
    );
  }
}
