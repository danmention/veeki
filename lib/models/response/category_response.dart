class Category {
  int? id;
  String? parentId;
  String? url;
  String? title;
  String? faIcon;
  String? featuredImg;
  String? showMenu;
  String? status;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.parentId,
        this.url,
        this.title,
        this.faIcon,
        this.featuredImg,
        this.showMenu,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    url = json['url'];
    title = json['title'];
    faIcon = json['fa_icon'];
    featuredImg = json['featured_img'];
    showMenu = json['show_menu'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['url'] = this.url;
    data['title'] = this.title;
    data['fa_icon'] = this.faIcon;
    data['featured_img'] = this.featuredImg;
    data['show_menu'] = this.showMenu;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}



class CategoryItem {
  String? title;
  String? parentId;
  String? faIcon;
  String? createdBy;
  String? url;
  String? updatedAt;
  String? createdAt;
  int? id;

  CategoryItem(
      {this.title,
        this.parentId,
        this.faIcon,
        this.createdBy,
        this.url,
        this.updatedAt,
        this.createdAt,
        this.id});

  CategoryItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    parentId = json['parent_id'];
    faIcon = json['fa_icon'];
    createdBy = json['created_by'];
    url = json['url'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['parent_id'] = this.parentId;
    data['fa_icon'] = this.faIcon;
    data['created_by'] = this.createdBy;
    data['url'] = this.url;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

