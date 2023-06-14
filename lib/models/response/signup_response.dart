class SignupResponse {
  String? respCode;
  String? respMessage;
  String? respDescription;
  SignupData? data;
  Null? errors;

  SignupResponse(
      {this.respCode,
        this.respMessage,
        this.respDescription,
        this.data,
        this.errors});

  SignupResponse.fromJson(Map<String, dynamic> json) {
    respCode = json['resp_code'];
    respMessage = json['resp_message'];
    respDescription = json['resp_description'];
    data = json['data'] != null ? new SignupData.fromJson(json['data']) : null;
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp_code'] = this.respCode;
    data['resp_message'] = this.respMessage;
    data['resp_description'] = this.respDescription;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errors'] = this.errors;
    return data;
  }
}

class SignupData {
  String? fullName;
  String? email;
  String? phone;
  String? dateOfBirth;
  String? city;
  String? state;
  String? identity;
  String? gender;
  String? verifyCode;
  String? role;
  int? categoryId;
  int? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  SignupData(
      {this.fullName,
        this.email,
        this.phone,
        this.dateOfBirth,
        this.city,
        this.state,
        this.identity,
        this.gender,
        this.verifyCode,
        this.role,
        this.categoryId,
        this.status,
        this.updatedAt,
        this.createdAt,
        this.id});

  SignupData.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    dateOfBirth = json['date_of_birth'];
    city = json['city'];
    state = json['state'];
    identity = json['identity'];
    gender = json['gender'];
    verifyCode = json['verify_code'];
    role = json['role'];
    categoryId = json['category_id'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['date_of_birth'] = this.dateOfBirth;
    data['city'] = this.city;
    data['state'] = this.state;
    data['identity'] = this.identity;
    data['gender'] = this.gender;
    data['verify_code'] = this.verifyCode;
    data['role'] = this.role;
    data['category_id'] = this.categoryId;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

