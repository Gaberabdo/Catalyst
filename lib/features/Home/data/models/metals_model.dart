class MetalItem {
  String? id;
  dynamic? pd;
  dynamic? pt;
  dynamic? rh;
  List<dynamic> pdDaily;
  List<dynamic> ptDaily;
  List<dynamic> rhDaily;


  MetalItem({
    this.id,
    this.pd,
    this.pt,
    this.rh,

    required this.pdDaily,
    required this.ptDaily,
    required this.rhDaily,
  });

  factory MetalItem.fromJson(Map<String, dynamic> json) {
    return MetalItem(
      id: json['_id'],
      pd: json['pd'],
      pt: json['pt'],
      rh: json['rh'],
      pdDaily: List<dynamic>.from(json['pdDaily']),
      ptDaily: List<dynamic>.from(json['ptDaily']),
      rhDaily: List<dynamic>.from(json['rhDaily']),

    );
  }
}
