class InboxModel {
  bool? success;
  double? code;
  List<String?>? notes;
  String? message;

  InboxModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool;
    code = json['code'] as double;
    notes = json['notes'] as List<String>;
    message = json['message'] as String;
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'code': code,
      'notes': notes,
      'message': message,
    };
  }
}
