import 'package:veeki/models/response/service_response.dart';

class AdminBookingResponse {
  String? respCode;
  String? respMessage;
  String? respDescription;
  Data? data;
  String? errors;

  AdminBookingResponse(
      {this.respCode,
        this.respMessage,
        this.respDescription,
        this.data,
        this.errors});

  AdminBookingResponse.fromJson(Map<String, dynamic> json) {
    respCode = json['resp_code'];
    respMessage = json['resp_message'];
    respDescription = json['resp_description'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  int? currentPage;
  List<AdminBooking>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <AdminBooking>[];
      json['data'].forEach((v) {
        data!.add(new AdminBooking.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class AdminBooking {
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
  List<Caregiver>? caregiver;

  AdminBooking(
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
        this.user,
        this.caregiver});

  AdminBooking.fromJson(Map<String, dynamic> json) {
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
    if (json['caregiver'] != null) {
      caregiver = <Caregiver>[];
      json['caregiver'].forEach((v) {
        caregiver!.add(new Caregiver.fromJson(v));
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
    if (this.caregiver != null) {
      data['caregiver'] = this.caregiver!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? fullName;
  String? gender;
  String? email;
  String? identity;
  String? availability;
  String? phone;
  Null? dateOfBirth;
  Null? streetAddress;
  Null? city;
  Null? state;
  Null? profileImage;
  Null? locationAddress;
  String? role;
  String? categoryId;
  Null? areaId;
  Null? areaName;
  Null? currentLat;
  Null? currentLong;
  Null? facebook;
  String? instagram;
  Null? workExperience;
  String? isAdmin;
  String? status;
  String? verifyCode;
  Null? isVerified;
  String? isFrequent;
  String? createdAt;
  String? updatedAt;

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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

class Caregiver {
  int? id;
  String? fullName;
  String? gender;
  String? email;
  String? identity;
  String? availability;
  String? phone;
  Null? dateOfBirth;
  Null? streetAddress;
  Null? city;
  Null? state;
  String? profileImage;
  Null? locationAddress;
  String? role;
  String? categoryId;
  Null? areaId;
  Null? areaName;
  Null? currentLat;
  Null? currentLong;
  Null? facebook;
  String? instagram;
  Null? workExperience;
  String? isAdmin;
  String? status;
  String? verifyCode;
  Null? isVerified;
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

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
