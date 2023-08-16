import 'package:veeki/models/response/service_response.dart';



// class MyBooking {
//   int? id;
//   String? userId;
//   String? caregiverUserId;
//   String? serviceId;
//   String? numberOfHour;
//   String? amount;
//   String? date;
//   String? timeFrom;
//   String? timeTo;
//   String? streetAddress;
//   String? popularLandMark;
//   String? area;
//   String? status;
//   String? createdAt;
//   String? updatedAt;
//   List<Service>? service;
//   List<Caregiver>? caregiver;
//
//   MyBooking(
//       {this.id,
//         this.userId,
//         this.caregiverUserId,
//         this.serviceId,
//         this.numberOfHour,
//         this.amount,
//         this.date,
//         this.timeFrom,
//         this.timeTo,
//         this.streetAddress,
//         this.popularLandMark,
//         this.area,
//         this.status,
//         this.createdAt,
//         this.updatedAt,
//         this.service,
//         this.caregiver});
//
//   MyBooking.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     caregiverUserId = json['caregiver_user_id'];
//     serviceId = json['service_id'];
//     numberOfHour = json['number_of_hour'];
//     amount = json['amount'];
//     date = json['date'];
//     timeFrom = json['time_from'];
//     timeTo = json['time_to'];
//     streetAddress = json['street_address'];
//     popularLandMark = json['popular_land_mark'];
//     area = json['area'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     if (json['service'] != null) {
//       service = <Service>[];
//       json['service'].forEach((v) {
//         service!.add(new Service.fromJson(v));
//       });
//     }
//     if (json['caregiver'] != null) {
//       caregiver = <Caregiver>[];
//       json['caregiver'].forEach((v) {
//         caregiver!.add(new Caregiver.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['caregiver_user_id'] = this.caregiverUserId;
//     data['service_id'] = this.serviceId;
//     data['number_of_hour'] = this.numberOfHour;
//     data['amount'] = this.amount;
//     data['date'] = this.date;
//     data['time_from'] = this.timeFrom;
//     data['time_to'] = this.timeTo;
//     data['street_address'] = this.streetAddress;
//     data['popular_land_mark'] = this.popularLandMark;
//     data['area'] = this.area;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.service != null) {
//       data['service'] = this.service!.map((v) => v.toJson()).toList();
//     }
//     if (this.caregiver != null) {
//       data['caregiver'] = this.caregiver!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }



class MyBooking {
  int? id;
  String? userId;
  String? caregiverUserId;
  String? serviceId;
  String? numberOfHour;
  String? amount;
  String? date;
  String? timeFrom;
  String? timeTo;
  String? streetAddress;
  String? popularLandMark;
  String? area;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<Service>? service;
  List<User>? user;

  MyBooking(
      {this.id,
        this.userId,
        this.caregiverUserId,
        this.serviceId,
        this.numberOfHour,
        this.amount,
        this.date,
        this.timeFrom,
        this.timeTo,
        this.streetAddress,
        this.popularLandMark,
        this.area,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.service,
        this.user});

  MyBooking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    caregiverUserId = json['caregiver_user_id'];
    serviceId = json['service_id'];
    numberOfHour = json['number_of_hour'];
    amount = json['amount'];
    date = json['date'];
    timeFrom = json['time_from'];
    timeTo = json['time_to'];
    streetAddress = json['street_address'];
    popularLandMark = json['popular_land_mark'];
    area = json['area'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['service'] != null) {
      service = <Service>[];
      json['service'].forEach((v) {
        service!.add(new Service.fromJson(v));
      });
    }
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['caregiver_user_id'] = this.caregiverUserId;
    data['service_id'] = this.serviceId;
    data['number_of_hour'] = this.numberOfHour;
    data['amount'] = this.amount;
    data['date'] = this.date;
    data['time_from'] = this.timeFrom;
    data['time_to'] = this.timeTo;
    data['street_address'] = this.streetAddress;
    data['popular_land_mark'] = this.popularLandMark;
    data['area'] = this.area;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.service != null) {
      data['service'] = this.service!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Caregiver {
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
  String? referralCode;
  String? aboutMe;
  String? firebaseToken;
  String? categoryId;
  Null? areaId;
  String? areaName;
  String? currentLat;
  String? currentLong;
  String? facebook;
  String? instagram;
  String? workExperience;
  String? isAdmin;
  String? status;
  String? verifyCode;
  bool? isVerified;
  String? isFrequent;
  String? createdAt;
  String? updatedAt;

  Caregiver(
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
        this.referralCode,
        this.aboutMe,
        this.firebaseToken,
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

  Caregiver.fromJson(Map<String, dynamic> json) {
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
    referralCode = json['referral_code'];
    aboutMe = json['about_me'];
    firebaseToken = json['firebase_token'];
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
    data['referral_code'] = this.referralCode;
    data['about_me'] = this.aboutMe;
    data['firebase_token'] = this.firebaseToken;
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

class Images {
  int? id;
  String? images;
  String? servicesId;
  String? userId;
  String? createdAt;
  String? updatedAt;

  Images(
      {this.id,
        this.images,
        this.servicesId,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    images = json['images'];
    servicesId = json['services_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['images'] = this.images;
    data['services_id'] = this.servicesId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}




// class Caregiver {
//   int? id;
//   String? fullName;
//   String? gender;
//   String? email;
//   String? identity;
//   String? availability;
//   String? phone;
//   String? dateOfBirth;
//   Null? streetAddress;
//   String? city;
//   String? state;
//   String? profileImage;
//   String? locationAddress;
//   String? role;
//   String? categoryId;
//   Null? areaId;
//   Null? areaName;
//   Null? currentLat;
//   Null? currentLong;
//   Null? facebook;
//   String? instagram;
//   String? workExperience;
//   String? isAdmin;
//   String? status;
//   String? verifyCode;
//   Null? isVerified;
//   String? isFrequent;
//   String? createdAt;
//   String? updatedAt;
//
//   Caregiver(
//       {this.id,
//         this.fullName,
//         this.gender,
//         this.email,
//         this.identity,
//         this.availability,
//         this.phone,
//         this.dateOfBirth,
//         this.streetAddress,
//         this.city,
//         this.state,
//         this.profileImage,
//         this.locationAddress,
//         this.role,
//         this.categoryId,
//         this.areaId,
//         this.areaName,
//         this.currentLat,
//         this.currentLong,
//         this.facebook,
//         this.instagram,
//         this.workExperience,
//         this.isAdmin,
//         this.status,
//         this.verifyCode,
//         this.isVerified,
//         this.isFrequent,
//         this.createdAt,
//         this.updatedAt});
//
//   Caregiver.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     fullName = json['full_name'];
//     gender = json['gender'];
//     email = json['email'];
//     identity = json['identity'];
//     availability = json['availability'];
//     phone = json['phone'];
//     dateOfBirth = json['date_of_birth'];
//     streetAddress = json['street_address'];
//     city = json['city'];
//     state = json['state'];
//     profileImage = json['profile_image'];
//     locationAddress = json['Location_address'];
//     role = json['role'];
//     categoryId = json['category_id'];
//     areaId = json['area_id'];
//     areaName = json['area_name'];
//     currentLat = json['current_lat'];
//     currentLong = json['current_long'];
//     facebook = json['facebook'];
//     instagram = json['instagram'];
//     workExperience = json['work_experience'];
//     isAdmin = json['is_admin'];
//     status = json['status'];
//     verifyCode = json['verify_code'];
//     isVerified = json['is_verified'];
//     isFrequent = json['is_frequent'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['full_name'] = this.fullName;
//     data['gender'] = this.gender;
//     data['email'] = this.email;
//     data['identity'] = this.identity;
//     data['availability'] = this.availability;
//     data['phone'] = this.phone;
//     data['date_of_birth'] = this.dateOfBirth;
//     data['street_address'] = this.streetAddress;
//     data['city'] = this.city;
//     data['state'] = this.state;
//     data['profile_image'] = this.profileImage;
//     data['Location_address'] = this.locationAddress;
//     data['role'] = this.role;
//     data['category_id'] = this.categoryId;
//     data['area_id'] = this.areaId;
//     data['area_name'] = this.areaName;
//     data['current_lat'] = this.currentLat;
//     data['current_long'] = this.currentLong;
//     data['facebook'] = this.facebook;
//     data['instagram'] = this.instagram;
//     data['work_experience'] = this.workExperience;
//     data['is_admin'] = this.isAdmin;
//     data['status'] = this.status;
//     data['verify_code'] = this.verifyCode;
//     data['is_verified'] = this.isVerified;
//     data['is_frequent'] = this.isFrequent;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
