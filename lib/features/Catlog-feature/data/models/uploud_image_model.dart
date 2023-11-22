class UploadImageModel {
  final String imageUrl;

  UploadImageModel({
    required this.imageUrl,
  });

  factory UploadImageModel.fromJson(Map<String, dynamic> json) {
    return UploadImageModel(
      imageUrl: json['image'],
    );
  }
}
