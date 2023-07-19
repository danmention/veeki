class Dispute {
  int? userId;
  String? title;
  String? desc;
  String? caregiverId;
  String? bookingId;
  int? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  Dispute(
      {this.userId,
        this.title,
        this.desc,
        this.caregiverId,
        this.bookingId,
        this.status,
        this.updatedAt,
        this.createdAt,
        this.id});

  Dispute.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    title = json['title'];
    desc = json['desc'];
    caregiverId = json['caregiver_id'];
    bookingId = json['booking_id'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['caregiver_id'] = this.caregiverId;
    data['booking_id'] = this.bookingId;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
