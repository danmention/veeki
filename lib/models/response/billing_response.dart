class Billing {
  int? id;
  String? amount;
  String? userId;
  String? purpose;
  String? referralCode;
  String? billingId;
  String? transactionReference;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? image;

  Billing(
      {this.id,
        this.amount,
        this.userId,
        this.purpose,
        this.referralCode,
        this.billingId,
        this.transactionReference,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.image});

  Billing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    userId = json['user_id'];
    purpose = json['purpose'];
    referralCode = json['referral_code'];
    billingId = json['billing_id'];
    transactionReference = json['transaction_reference'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['user_id'] = this.userId;
    data['purpose'] = this.purpose;
    data['referral_code'] = this.referralCode;
    data['billing_id'] = this.billingId;
    data['transaction_reference'] = this.transactionReference;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
