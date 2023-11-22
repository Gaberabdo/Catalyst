class OtpModel{
  bool?success;
  String? token;
  OtpModel.fromJson(Map<String,dynamic>json){
    success=json["success"];
    token=json["token"];
  }
}