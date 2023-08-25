class SignupRequest {
  String? fullname;
  String? password;
  String? gender;
  String? phone;
  String? email;
  String? StreetAddress;
  String? state_id;
  String? area_id;
  int? category_id;
  String? DateOfBirth;
 String? user_type;
 String? referral_code;
  SignupRequest(
      {this.fullname,
        this.referral_code,
        this.password,
        this.gender,
        this.phone,
        this.email,
        this.StreetAddress,
        this.state_id,
        this.area_id,
        this.category_id,
        this.DateOfBirth,
        this.user_type,

      });

  SignupRequest.fromJson(Map<String, dynamic> json) {
    referral_code = json['referral_code'];
    fullname = json['fullname'];
    password = json['password'];
    gender = json['gender'];
    phone = json['phone'];
    email = json['email'];
    DateOfBirth = json['DateOfBirth'];
    StreetAddress = json['StreetAddress'];
    state_id = json['state_id'];
    area_id = json['area_id'];
    user_type = json['user_type'];
    category_id = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['referral_code'] = this.referral_code;
    data['fullname'] = this.fullname;
    data['password'] = this.password;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['user_type'] = this.user_type;
    data['category_id'] = this.category_id;
    data['email'] = this.email;
    data['DateOfBirth'] = this.DateOfBirth;
    data['StreetAddress'] = this.StreetAddress;
    data['state_id'] = this.state_id;
    data['area_id'] = this.area_id;
    return data;
  }
}
