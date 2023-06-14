

import '../userModel.dart';

class LoginResponse {
  CurrentUser? user;
  TokenData? tokenData;

  LoginResponse({this.user, this.tokenData});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new CurrentUser.fromJson(json['user']) : null;
    tokenData = json['token_data'] != null
        ? new TokenData.fromJson(json['token_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.tokenData != null) {
      data['token_data'] = this.tokenData!.toJson();
    }
    return data;
  }
}



class TokenData {
  String? token;
  int? expirerIn;

  TokenData({this.token, this.expirerIn});

  TokenData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expirerIn = json['expirer_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expirer_in'] = this.expirerIn;
    return data;
  }
}
