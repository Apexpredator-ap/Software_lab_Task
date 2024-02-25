class PostRegisterDeviceAuthResp {
  bool? success;
  String? message;

  PostRegisterDeviceAuthResp({this.success, this.message});

  PostRegisterDeviceAuthResp.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (success != null) {
      data['success'] = success;
    }
    if (message != null) {
      data['message'] = message;
    }
    return data;
  }
}
