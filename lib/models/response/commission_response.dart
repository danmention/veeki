class CommissionResponse {
  String? fee;
  String? type;
  String? updatedAt;
  String? createdAt;
  int? id;

  CommissionResponse(
      {this.fee, this.type, this.updatedAt, this.createdAt, this.id});

  CommissionResponse.fromJson(Map<String, dynamic> json) {
    fee = json['fee'];
    type = json['type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fee'] = this.fee;
    data['type'] = this.type;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
