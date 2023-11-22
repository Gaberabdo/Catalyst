class UpdateModel {
  final bool success;

  UpdateModel({
    required this.success,
  });

  factory UpdateModel.fromJson(Map<String, dynamic> json) {
    return UpdateModel(
      success: json['success'],
    );
  }
}
