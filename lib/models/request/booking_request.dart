class BookingRequest {
  int? userId;
  int? caregiverUserId;
  int? serviceId;
  int? numberOfHour;
  int? amount;
  String? date;
  String? timeFrom;
  String? timeTo;
  String? streetAddress;
  String? popularLandMark;
  String? area;
  String? referral_code;

  BookingRequest(
      {this.userId,
        this.caregiverUserId,
        this.serviceId,
        this.numberOfHour,
        this.referral_code,
        this.amount,
        this.date,
        this.timeFrom,
        this.timeTo,
        this.streetAddress,
        this.popularLandMark,
        this.area});

  BookingRequest.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    caregiverUserId = json['caregiver_user_id'];
    serviceId = json['service_id'];
    numberOfHour = json['number_of_hour'];
    amount = json['amount'];
    date = json['date'];
    timeFrom = json['time_from'];
    timeTo = json['time_to'];
    streetAddress = json['street_address'];
    popularLandMark = json['popular_land_mark'];
    area = json['area'];
    referral_code = json['referral_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['caregiver_user_id'] = this.caregiverUserId;
    data['service_id'] = this.serviceId;
    data['number_of_hour'] = this.numberOfHour;
    data['amount'] = this.amount;
    data['referral_code'] = this.referral_code;
    data['date'] = this.date;
    data['time_from'] = this.timeFrom;
    data['time_to'] = this.timeTo;
    data['street_address'] = this.streetAddress;
    data['popular_land_mark'] = this.popularLandMark;
    data['area'] = this.area;
    return data;
  }
}
