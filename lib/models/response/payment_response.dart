class PaymentReponse {
  int? id;
  String? amount;
  String? userId;
  String? purpose;
  String? transactionReference;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? name;

  PaymentReponse(
      {this.id,
        this.amount,
        this.userId,
        this.purpose,
        this.transactionReference,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.name});

  PaymentReponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    userId = json['user_id'];
    purpose = json['purpose'];
    transactionReference = json['transaction_reference'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['user_id'] = this.userId;
    data['purpose'] = this.purpose;
    data['transaction_reference'] = this.transactionReference;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    return data;
  }
}
