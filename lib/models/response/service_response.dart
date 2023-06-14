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
  String? createdAt;
  String? updatedAt;
  List<CurrentUser>? user;
  List<Images>? images;

  Service(
      {this.id,
        this.userId,
        this.categoryId,
        this.title,
        this.amount,
        this.amountRange,
        this.desc,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.images});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    title = json['title'];
    amount = json['amount'];
    amountRange = json['amount_range'];
    desc = json['desc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['user'] != null) {
      user = <CurrentUser>[];
      json['user'].forEach((v) {
        user!.add( CurrentUser.fromJson(v));
      });
    }
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
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


class ServiceItem {
  String? userId;
  String? categoryId;
  String? title;
  String? desc;
  String? amount;
  String? amountRange;
  String? updatedAt;
  String? createdAt;
  int? id;

  ServiceItem(
      {this.userId,
        this.categoryId,
        this.title,
        this.desc,
        this.amount,
        this.amountRange,
        this.updatedAt,
        this.createdAt,
        this.id});

  ServiceItem.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    categoryId = json['category_id'];
    title = json['title'];
    desc = json['desc'];
    amount = json['amount'];
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
    data['amount'] = this.amount;
    data['amount_range'] = this.amountRange;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
