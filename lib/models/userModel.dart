import 'dart:io';
import 'businessLayer/global.dart' as global;

class CurrentUser {
  int? id;
  String? fullName;
  String? gender;
  String? email;
  String? identity;
  String? availability;
  String? phone;
  String? dateOfBirth;
  String? streetAddress;
  String? city;
  String? state;
  String? profileImage;
  String? locationAddress;
  String? role;
  String? categoryId;
  String? areaId;
  String? areaName;
  String? currentLat;
  String? currentLong;
  String? facebook;
  String? instagram;
  String? workExperience;
  String? isAdmin;
  String? status;
  String? verifyCode;
  String? isVerified;
  String? isFrequent;
  String? createdAt;
  String? updatedAt;

  CurrentUser(
      {this.id,
        this.fullName,
        this.gender,
        this.email,
        this.identity,
        this.availability,
        this.phone,
        this.dateOfBirth,
        this.streetAddress,
        this.city,
        this.state,
        this.profileImage,
        this.locationAddress,
        this.role,
        this.categoryId,
        this.areaId,
        this.areaName,
        this.currentLat,
        this.currentLong,
        this.facebook,
        this.instagram,
        this.workExperience,
        this.isAdmin,
        this.status,
        this.verifyCode,
        this.isVerified,
        this.isFrequent,
        this.createdAt,
        this.updatedAt});

  CurrentUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    gender = json['gender'];
    email = json['email'];
    identity = json['identity'];
    availability = json['availability'];
    phone = json['phone'];
    dateOfBirth = json['date_of_birth'];
    streetAddress = json['street_address'];
    city = json['city'];
    state = json['state'];
    profileImage = json['profile_image'];
    locationAddress = json['Location_address'];
    role = json['role'];
    categoryId = json['category_id'];
    areaId = json['area_id'];
    areaName = json['area_name'];
    currentLat = json['current_lat'];
    currentLong = json['current_long'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    workExperience = json['work_experience'];
    isAdmin = json['is_admin'];
    status = json['status'];
    verifyCode = json['verify_code'];
    isVerified = json['is_verified'];
    isFrequent = json['is_frequent'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['identity'] = this.identity;
    data['availability'] = this.availability;
    data['phone'] = this.phone;
    data['date_of_birth'] = this.dateOfBirth;
    data['street_address'] = this.streetAddress;
    data['city'] = this.city;
    data['state'] = this.state;
    data['profile_image'] = this.profileImage;
    data['Location_address'] = this.locationAddress;
    data['role'] = this.role;
    data['category_id'] = this.categoryId;
    data['area_id'] = this.areaId;
    data['area_name'] = this.areaName;
    data['current_lat'] = this.currentLat;
    data['current_long'] = this.currentLong;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['work_experience'] = this.workExperience;
    data['is_admin'] = this.isAdmin;
    data['status'] = this.status;
    data['verify_code'] = this.verifyCode;
    data['is_verified'] = this.isVerified;
    data['is_frequent'] = this.isFrequent;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


