class Discount {
  String? userId;
  String? fee;
  String? type;
  int? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  Discount(
      {this.userId,
        this.fee,
        this.type,
        this.status,
        this.updatedAt,
        this.createdAt,
        this.id});

  Discount.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fee = json['fee'];
    type = json['type'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['fee'] = this.fee;
    data['type'] = this.type;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
