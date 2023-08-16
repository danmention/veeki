import '../userModel.dart';




class ServiceModel {
  int? currentPage;
  List<Service>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  ServiceModel(
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

  ServiceModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Service>[];
      json['data'].forEach((v) {
        data!.add(new Service.fromJson(v));
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

class Service {
  int? id;
  String? userId;
  String? categoryId;
  String? title;
  String? amount;
  String? amountRange;
  String? desc;
  String? status;
  String? stateId;
  String? areaId;
  String? unit;
  String? createdAt;
  String? updatedAt;
  List<User>? user;
  String? state;
  String? area;
  List<Images>? images;

  Service(
      {this.id,
        this.userId,
        this.categoryId,
        this.title,
        this.amount,
        this.amountRange,
        this.desc,
        this.status,
        this.stateId,
        this.areaId,
        this.unit,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.state,
        this.area,
        this.images});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    title = json['title'];
    amount = json['amount'];
    amountRange = json['amount_range'];
    desc = json['desc'];
    status = json['status'];
    stateId = json['state_id'];
    areaId = json['area_id'];
    unit = json['unit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
    state = json['state'];
    area = json['area'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['amount'] = this.amount;
    data['amount_range'] = this.amountRange;
    data['desc'] = this.desc;
    data['status'] = this.status;
    data['state_id'] = this.stateId;
    data['area_id'] = this.areaId;
    data['unit'] = this.unit;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    data['state'] = this.state;
    data['area'] = this.area;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
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
  bool? isVerified;
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















// class ServiceModel {
//   int? currentPage;
//   List<Service>? data;
//   String? firstPageUrl;
//   int? from;
//   int? lastPage;
//   String? lastPageUrl;
//   List<Links>? links;
//   String? nextPageUrl;
//   String? path;
//   int? perPage;
//   String? prevPageUrl;
//   int? to;
//   int? total;
//
//   ServiceModel(
//       {this.currentPage,
//         this.data,
//         this.firstPageUrl,
//         this.from,
//         this.lastPage,
//         this.lastPageUrl,
//         this.links,
//         this.nextPageUrl,
//         this.path,
//         this.perPage,
//         this.prevPageUrl,
//         this.to,
//         this.total});
//
//   ServiceModel.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     if (json['data'] != null) {
//       data = <Service>[];
//       json['data'].forEach((v) {
//         data!.add(new Service.fromJson(v));
//       });
//     }
//     firstPageUrl = json['first_page_url'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     lastPageUrl = json['last_page_url'];
//     if (json['links'] != null) {
//       links = <Links>[];
//       json['links'].forEach((v) {
//         links!.add(new Links.fromJson(v));
//       });
//     }
//     nextPageUrl = json['next_page_url'];
//     path = json['path'];
//     perPage = json['per_page'];
//     prevPageUrl = json['prev_page_url'];
//     to = json['to'];
//     total = json['total'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['current_page'] = this.currentPage;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['first_page_url'] = this.firstPageUrl;
//     data['from'] = this.from;
//     data['last_page'] = this.lastPage;
//     data['last_page_url'] = this.lastPageUrl;
//     if (this.links != null) {
//       data['links'] = this.links!.map((v) => v.toJson()).toList();
//     }
//     data['next_page_url'] = this.nextPageUrl;
//     data['path'] = this.path;
//     data['per_page'] = this.perPage;
//     data['prev_page_url'] = this.prevPageUrl;
//     data['to'] = this.to;
//     data['total'] = this.total;
//     return data;
//   }
// }
//
// class Service {
//   int? id;
//   String? userId;
//   String? categoryId;
//   String? title;
//   String? amount;
//   String? amountRange;
//   String? desc;
//   String? state;
//   String? area;
//   String? createdAt;
//   String? updatedAt;
//   List<CurrentUser>? user;
//   List<Images>? images;
//
//   Service(
//       {this.id,
//         this.userId,
//         this.categoryId,
//         this.title,
//         this.amount,
//         this.amountRange,
//         this.desc,
//         this.state,
//         this.area,
//         this.createdAt,
//         this.updatedAt,
//         this.user,
//         this.images});
//
//   Service.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     state = json['state'];
//     area = json['area'];
//     categoryId = json['category_id'];
//     title = json['title'];
//     amount = json['amount'];
//     amountRange = json['amount_range'];
//     desc = json['desc'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//
//     // if (json['user'] != null) {
//     //   user = <User>[];
//     //   json['user'].forEach((v) {
//     //     user!.add( User.fromJson(v));
//     //   });
//     // }
//
//     if (json['user'] != null) {
//       user = <CurrentUser>[];
//       json['user'].forEach((v) {
//         user!.add( CurrentUser.fromJson(v));
//       });
//     }
//
//
//
//     if (json['images'] != null) {
//       images = <Images>[];
//       json['images'].forEach((v) {
//         images!.add(new Images.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['category_id'] = this.categoryId;
//     data['title'] = this.title;
//     data['amount'] = this.amount;
//     data['state'] = this.state;
//     data['area'] = this.area;
//     data['amount_range'] = this.amountRange;
//     data['desc'] = this.desc;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.user != null) {
//       data['user'] = this.user!.map((v) => v.toJson()).toList();
//     }
//     if (this.images != null) {
//       data['images'] = this.images!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
//
//
//
//
//
//
// class Images {
//   int? id;
//   String? images;
//   String? servicesId;
//   String? userId;
//   String? createdAt;
//   String? updatedAt;
//
//   Images(
//       {this.id,
//         this.images,
//         this.servicesId,
//         this.userId,
//         this.createdAt,
//         this.updatedAt});
//
//   Images.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     images = json['images'];
//     servicesId = json['services_id'];
//     userId = json['user_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['images'] = this.images;
//     data['services_id'] = this.servicesId;
//     data['user_id'] = this.userId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
// class Links {
//   String? url;
//   String? label;
//   bool? active;
//
//   Links({this.url, this.label, this.active});
//
//   Links.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     label = json['label'];
//     active = json['active'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['url'] = this.url;
//     data['label'] = this.label;
//     data['active'] = this.active;
//     return data;
//   }
// }


class ServiceItem {
  String? userId;
  String? categoryId;
  String? title;
  String? desc;
  String? unit;
  String? amount;
  String? amountRange;
  String? updatedAt;
  String? createdAt;
   String? state_id;
   String? area_id;
  int? id;

  ServiceItem(
      {this.userId,
        this.categoryId,
        this.title,
        this.unit,
        this.desc,
        this.amount,
        this.amountRange,
        this.area_id,
        this.state_id,
        this.updatedAt,
        this.createdAt,
        this.id});

  ServiceItem.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    categoryId = json['category_id'];
    unit = json['unit'];
    title = json['title'];
    desc = json['desc'];
    amount = json['amount'];
    area_id = json['city_id'];
    state_id = json['state_id'];
    amountRange = json['amount_range'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['unit'] = this.unit;
    data['state_id'] = this.state_id;
    data['area_id'] = this.area_id;
    data['amount'] = this.amount;
    data['amount_range'] = this.amountRange;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
