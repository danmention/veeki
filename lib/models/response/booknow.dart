class BookNow {
  int? userId;
  int? booking_id;
  String? purpose;
  String? referral_code;
  int? amount;
  String? transactionReference;
  String? updatedAt;
  String? createdAt;
  int? id;

  BookNow(
      {this.userId,
        this.booking_id,
        this.referral_code,
        this.purpose,
        this.amount,
        this.transactionReference,
        this.updatedAt,
        this.createdAt,
        this.id});

  BookNow.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    booking_id = json['billing_id'];
    referral_code = json['referral_code'];
    purpose = json['purpose'];
    amount = json['amount'];
    transactionReference = json['transaction_reference'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['referral_code'] = this.referral_code;
    data['billing_id'] = this.booking_id;
    data['user_id'] = this.userId;
    data['purpose'] = this.purpose;
    data['amount'] = this.amount;
    data['transaction_reference'] = this.transactionReference;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
