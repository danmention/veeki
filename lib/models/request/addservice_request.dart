import 'dart:io';

class AddServiceRequest {

  String? title;
  String? desc;
  String? amount;
  String? amountrange;
  File? image;
  int? userId;
  int? categoryId;



  AddServiceRequest(
      {

        this.title,
        this.desc,
        this.amount,
        this.image,
        this.amountrange,
        this.categoryId,
        this.userId,




      });



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['amount'] = this.amount;
    data['amount_range'] = this.amountrange;
    data['image'] = this.image;
    // data['state_id'] = this.state_id;
    // data['city_id'] = this.city_id;


    return data;
  }
}