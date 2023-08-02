class ReferralFee {
  int? id;
  String? userId;
  String? fee;
  String? type;
  String? desc;
  String? status;
  String? createdAt;
  String? updatedAt;

  ReferralFee(
      {this.id,
        this.userId,
        this.fee,
        this.type,
        this.desc,
        this.status,
        this.createdAt,
        this.updatedAt});

  ReferralFee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fee = json['fee'];
    type = json['type'];
    desc = json['desc'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['fee'] = this.fee;
    data['type'] = this.type;
    data['desc'] = this.desc;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
