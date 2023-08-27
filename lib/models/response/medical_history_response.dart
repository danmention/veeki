class MedicalHistoryResponse {
  String? userId;
  String? age;
  String? gender;
  String? weight;
  String? mobilityOptions;
  String? stayAddress;
  String? nextOfKinName;
  String? nextOfKinPhone;
  String? nextOfKinEmail;
  String? nextOfKinAltPhone;
  String? nextOfKinAltAddress;
  String? nextOfKinAltGender;
  bool? shareNextOfKinInfo;
  String? lastCheckedBp;
  String? lastCheckedSugarLevel;
  String? pastMedicalHistory;
  String? conditionsUnderManagement;
  String? updatedAt;
  String? createdAt;
  int? id;

  MedicalHistoryResponse(
      {this.userId,
        this.age,
        this.gender,
        this.weight,
        this.mobilityOptions,
        this.stayAddress,
        this.nextOfKinName,
        this.nextOfKinPhone,
        this.nextOfKinEmail,
        this.nextOfKinAltPhone,
        this.nextOfKinAltAddress,
        this.nextOfKinAltGender,
        this.shareNextOfKinInfo,
        this.lastCheckedBp,
        this.lastCheckedSugarLevel,
        this.pastMedicalHistory,
        this.conditionsUnderManagement,
        this.updatedAt,
        this.createdAt,
        this.id});

  MedicalHistoryResponse.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    age = json['age'];
    gender = json['gender'];
    weight = json['weight'];
    mobilityOptions = json['mobility_options'];
    stayAddress = json['stay_address'];
    nextOfKinName = json['next_of_kin_name'];
    nextOfKinPhone = json['next_of_kin_phone'];
    nextOfKinEmail = json['next_of_kin_email'];
    nextOfKinAltPhone = json['next_of_kin_alt_phone'];
    nextOfKinAltAddress = json['next_of_kin_alt_address'];
    nextOfKinAltGender = json['next_of_kin_alt_gender'];
    shareNextOfKinInfo = json['share_next_of_kin_info'];
    lastCheckedBp = json['last_checked_bp'];
    lastCheckedSugarLevel = json['last_checked_sugar_level'];
    pastMedicalHistory = json['past_medical_history'];
    conditionsUnderManagement = json['conditions_under_management'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['weight'] = this.weight;
    data['mobility_options'] = this.mobilityOptions;
    data['stay_address'] = this.stayAddress;
    data['next_of_kin_name'] = this.nextOfKinName;
    data['next_of_kin_phone'] = this.nextOfKinPhone;
    data['next_of_kin_email'] = this.nextOfKinEmail;
    data['next_of_kin_alt_phone'] = this.nextOfKinAltPhone;
    data['next_of_kin_alt_address'] = this.nextOfKinAltAddress;
    data['next_of_kin_alt_gender'] = this.nextOfKinAltGender;
    data['share_next_of_kin_info'] = this.shareNextOfKinInfo;
    data['last_checked_bp'] = this.lastCheckedBp;
    data['last_checked_sugar_level'] = this.lastCheckedSugarLevel;
    data['past_medical_history'] = this.pastMedicalHistory;
    data['conditions_under_management'] = this.conditionsUnderManagement;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
