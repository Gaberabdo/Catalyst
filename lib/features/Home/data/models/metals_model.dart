class MetalItem {
  String? id;
  int? pd;
  int? pt;
  int? rh;
  List<int> pdDaily;
  List<int> ptDaily;
  List<int> rhDaily;


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
      pdDaily: List<int>.from(json['pdDaily']),
      ptDaily: List<int>.from(json['ptDaily']),
      rhDaily: List<int>.from(json['rhDaily']),

    );
  }
}
