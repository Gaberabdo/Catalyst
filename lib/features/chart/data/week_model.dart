// class MetalData {
//   bool success;
//   int code;
//   Metal metal;
//
//   MetalData({
//     required this.success,
//     required this.code,
//     required this.metal,
//   });
//
//   factory MetalData.fromJson(Map<String, dynamic> json) {
//     return MetalData(
//       success: json['success'],
//       code: json['code'],
//       metal: Metal.fromJson(json['metal']),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'success': success,
//       'code': code,
//       'metal': metal.toJson(),
//     };
//   }
// }
//
// class Metal {
//   String id;
//   int pd;
//   int pt;
//   int rh;
//   DateTime date;
//   List<int> pdDaily;
//   List<int> ptDaily;
//   List<int> rhDaily;
//
//   Metal({
//     required this.id,
//     required this.pd,
//     required this.pt,
//     required this.rh,
//     required this.date,
//     required this.pdDaily,
//     required this.ptDaily,
//     required this.rhDaily,
//   });
//
//   factory Metal.fromJson(Map<String, dynamic> json) {
//     return Metal(
//       id: json['_id'],
//       pd: json['pd'],
//       pt: json['pt'],
//       rh: json['rh'],
//       date: DateTime.parse(json['date']),
//       pdDaily: List<int>.from(json['pdDaily']),
//       ptDaily: List<int>.from(json['ptDaily']),
//       rhDaily: List<int>.from(json['rhDaily']),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'pd': pd,
//       'pt': pt,
//       'rh': rh,
//       'date': date.toIso8601String(),
//       'pdDaily': pdDaily,
//       'ptDaily': ptDaily,
//       'rhDaily': rhDaily,
//     };
//   }
// }

//--------
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
