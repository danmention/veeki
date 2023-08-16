class BookConfirmRequest {
  int? userId;
  int? booking_id;
  String? purpose;
  String? referral_code;
  int? amount;
  String? transactionReference;


  BookConfirmRequest(
      {this.userId,
        this.booking_id,
        this.referral_code,
        this.purpose,
        this.amount,
        this.transactionReference,

        });

  BookConfirmRequest.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    booking_id = json['booking_id'];
    referral_code = json['referral_code'];
    purpose = json['purpose'];
    amount = json['amount'];
    transactionReference = json['transaction_reference'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['referral_code'] = this.referral_code;
    data['booking_id'] = this.booking_id;
    data['user_id'] = this.userId;
    data['purpose'] = this.purpose;
    data['amount'] = this.amount;
    data['transaction_reference'] = this.transactionReference;

    return data;
  }
}