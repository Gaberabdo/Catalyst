class CatalyticsModel {
  String id;
  String admin;
  String name;
  CatalyticsModelImage? image;

  CatalyticsModel({
    required this.id,
    required this.admin,
    required this.name,
    required this.image,
  });

  factory CatalyticsModel.fromJson(Map<String, dynamic> json) {
    return CatalyticsModel(
      id: json['_id'],
      admin: json['admin'],
      name: json['name'],
      image: json['image'] == null ? null : CatalyticsModelImage.fromJson(json['image']),
    );
  }
}

class CatalyticsModelImage {
  String url;
  String? publicId;

  CatalyticsModelImage({
    required this.url,
    this.publicId,
  });

  factory CatalyticsModelImage.fromJson(Map<String, dynamic> json) {
    return CatalyticsModelImage(
      url: json['url'],
      publicId: json['public_id'],
    );
  }
}

class CatalyticsModelResponse {
  bool success;
  int code;
  List<CatalyticsModel> CatalyticsModels;

  CatalyticsModelResponse({
    required this.success,
    required this.code,
    required this.CatalyticsModels,
  });

  factory CatalyticsModelResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> CatalyticsModelsJson = json['CatalyticsModels'];
    List<CatalyticsModel> CatalyticsModels =
    CatalyticsModelsJson.map((CatalyticsModelJson) => CatalyticsModel.fromJson(CatalyticsModelJson)).toList();

    return CatalyticsModelResponse(
      success: json['success'],
      code: json['code'],
      CatalyticsModels: CatalyticsModels,
    );
  }
}
