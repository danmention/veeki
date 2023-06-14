import 'dart:convert';
import 'dart:io';
import 'package:veeki/models/businessLayer/global.dart' as global;


import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;
import 'package:veeki/models/request/booking_request.dart';
import 'package:veeki/models/response/booking_response.dart';


import '../request/login_request.dart';
import '../request/signup_request.dart';
import '../response/UserResponseModel.dart';

import '../response/login_response.dart';
import '../response/registeration_complete_response.dart';
import '../response/service_response.dart';
import '../response/signup_response.dart';
import '../response/state_response.dart';
import '../response/testimony_response.dart';

import '../response/category_response.dart';
import '../termsAndConditionModel.dart';

import '../userModel.dart';
import 'apiResult.dart';
import 'dioResult.dart';



class APIHelper {

  dynamic getAPIResult<T>(final response, T recordList) {
    try {
      dynamic result;
      result = APIResult.fromJson(json.decode(response.body), recordList);
      return result;
    } catch (e) {
      print("Exception - getAPIResult():" + e.toString());
    }
  }


  dynamic getDioResult<T>(final response, T recordList) {
    try {
      dynamic result;
      result = DioResult.fromJson(response, recordList);
      return result;
    } catch (e) {
      print("Exception - getDioResult():" + e.toString());
    }
  }



  Future<dynamic> getAllCategory() async {
    try {
      final response = await http.get(
        Uri.parse("${global.baseUrl}category"),
        headers: await global.getApiHeaders(false),

      );


      dynamic recordList;
      if (response.statusCode == 200 && json.decode(response.body)["resp_code"] == "00") {

        recordList = List<Category>.from(json.decode(response.body)["data"].map((x) => Category.fromJson(x)));



      } else {
        recordList = null;
      }

      return getAPIResult(response, recordList);

    } catch (e) {
      print("Exception - getAllCategory " + e.toString());
    }
  }
  Future<dynamic> updateProfileImage({int? id, File? user_image,}) async {
    try {
      Response response;
      var dio = Dio();
      var formData = FormData.fromMap({

        "user_id": id,
        'picture': user_image != null ? await MultipartFile.fromFile(user_image.path.toString()) : null,
      });

      response = await dio.post('${global.baseUrl}profile/update/dp',
          data: formData,
          options: Options(
            headers: await global.getApiHeaders(true),
          ));
      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = CurrentUser.fromJson(response.data['data']);
        //  recordList.token = response.data["token"];
      } else {
        recordList = null;
      }
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception - submitreport(): " + e.toString());
    }
  }






  Future<dynamic> addService({int? id, File? user_image,String? title,
    String? desc,String? amount,int? cat_id,String? amountrange,}) async {
    try {
      Response response;
      var dio = Dio();
      var formData = FormData.fromMap({

        "user_id": id,
        "category_id": cat_id,
        "title": title,
        "amount": amount,
        "amount_range": amountrange,
        "desc": desc,
        'image': user_image != null ? await MultipartFile.fromFile(user_image.path.toString()) : null,
      });

      response = await dio.post('${global.baseUrl}services/create',
          data: formData,
          options: Options(
            headers: await global.getApiHeaders(true),
          ));
      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = ServiceItem.fromJson(response.data['data']);
        //  recordList.token = response.data["token"];
      } else {
        recordList = null;
      }
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception - addService(): " + e.toString());
    }
  }


  Future<dynamic> addServiceImages({int? userid, List<File>? user_image,int? serviceid,}) async {
    try {
      Response response;
      var dio = Dio();
      final uploadList = <MultipartFile>[];
      for (final imageFiles in user_image!) {
        uploadList.add(
          await MultipartFile.fromFile(
            imageFiles.path.toString(),
            filename: imageFiles.path.split('/').last,
          ),
        );
      }
      // List<MultipartFile> multipartImageList = [];
      // for (File imageFile in user_image!) {
      //  // String fileName = imageFile.path.split('/').last;
      //   String fileName = imageFile.path.toString();
      //   MultipartFile multipartFile = await MultipartFile.fromFile(
      //     imageFile.path,
      //     filename: fileName,
      //   );
      //   multipartImageList.add(multipartFile);
      // }
      var formData = FormData.fromMap({

        "user_id": userid,
        "service_id": serviceid,
      //  'images[]': user_image != null ? await MultipartFile.fromFile(user_image.path.toString()) : null,
       // 'images': multipartImageList,
        'images[]': uploadList,
      });

      response = await dio.post('${global.baseUrl}services/add-images',
          data: formData,
          options: Options(
            headers: await global.getApiHeaders(true),
          ));

      // &&  json.decode(response.data['data']) != null
      dynamic recordList;
      if (response.statusCode == 200) {
        recordList =response.data['data'] ;
        //  recordList.token = response.data["token"];
      } else {
        recordList = null;
      }
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception - addImagesService(): " + e.toString());
    }
  }







  Future<dynamic> getAllUsers() async {
    try {
      final response = await http.post(
        Uri.parse("${global.baseUrl}admin/users"),
        headers: await global.getApiHeaders(true),

      );


      dynamic recordList;
      if (response.statusCode == 200 && json.decode(response.body)["resp_code"] == "00") {

        recordList = List<CurrentUser>.from(json.decode(response.body)["data"].map((x) => CurrentUser.fromJson(x)));



      } else {
        recordList = null;
      }

      return getAPIResult(response, recordList);

    } catch (e) {
      print("Exception - getAllUser " + e.toString());
    }
  }


  Future<dynamic> getAllService( int pageNumber, ) async {
    try {
      final response = await http.get(
        Uri.parse("${global.baseUrl}services?page=${pageNumber.toString()}"),
        headers: await global.getApiHeaders(true),

      );

      dynamic recordList;
      if (response.statusCode == 200 && json.decode(response.body)["resp_code"] == "00") {
        recordList = List<Service>.from(json.decode(response.body)["data"]["data"].map((x) => Service.fromJson(x)));
      } else {
        recordList = null;
      }
      return getAPIResult(response, recordList);
    } catch (e) {
      print("Exception - getallService(): " + e.toString());
    }
  }








  Future<dynamic> updateProfile(int user_id, String phone, String dob,
      String area, String state,String street ) async {
    try {
      final response = await http.post(
        Uri.parse("${global.baseUrl}profile/edit"),
        headers: await global.getApiHeaders(true),
        body: json.encode(
            {
              "user_id": user_id,
              "phone": phone,
              "DateOfBirth": dob,
              "StreetAddress": street,
              "state": state,
              "city":area,


            }

        ),
      );

      dynamic recordList;
      if (response.statusCode == 200 && json.decode(response.body)["resp_code"] == "00") {
        recordList = CurrentUser.fromJson(json.decode(response.body)["data"]);
      } else {
        recordList = null;
      }
      return getAPIResult(response, recordList);
    } catch (e) {
      print("Exception - updateProfile(): " + e.toString());
    }
  }


  Future<dynamic> setAvailability(int user_id,String active) async {
    try {
      final response = await http.post(
        Uri.parse("${global.baseUrl}profile/availability/status"),
        headers: await global.getApiHeaders(true),
        body: json.encode(
            {
              "user_id": user_id,
              "availability": active,


            }

        ),
      );

      dynamic recordList;
      if (response.statusCode == 200 && json.decode(response.body)["resp_code"] == "00") {
        recordList = CurrentUser.fromJson(json.decode(response.body)["data"]);
      } else {
        recordList = null;
      }
      return getAPIResult(response, recordList);
    } catch (e) {
      print("Exception - setAvailability(): " + e.toString());
    }
  }




  Future<dynamic> bookingstatus({int?id, String? status,}) async {
    try {
      final response = await http.post(
        Uri.parse("${global.baseUrl}user/booking/booking-status"),
        headers: await global.getApiHeaders(true),
        body: json.encode(
            {
              "id" : id,
              "status": status,

            }

        ),
      );

      dynamic recordList;
      if (response.statusCode == 200 && json.decode(response.body)["resp_code"] == "00") {
        recordList = CurrentUser.fromJson(json.decode(response.body)["data"]);
      } else {
        recordList = null;
      }
      return getAPIResult(response, recordList);
    } catch (e) {
      print("Exception - setbookingstatus(): " + e.toString());
    }
  }

  Future<dynamic> bookappointment(
    BookingRequest bookingRequest

      ) async {
    try {


      var item =    json.encode(
          bookingRequest);
      print(item);

      final response = await http.post(
        Uri.parse("${global.baseUrl}user/booking/create"),
        headers: await global.getApiHeaders(true),
        body: json.encode(
            bookingRequest
            // {
            //   "user_id" : user_id,
            //   "caregiver_user_id": caregiver_user_id,
            //   "service_id" : service_id,
            //   "number_of_hour" : number_of_hour,
            //   "amount": amount,
            //   "date": date,
            //   "time_from": time_from,
            //   "time_to": time_to,
            //   "street_address" : street_address,
            //   "popular_land_mark" :popular_land_mark,
            //   "area" :area
            //
            //
            // }

        ),
      );

      dynamic recordList;
      if (response.statusCode == 200 ) {
        recordList = BookingResponse.fromJson(json.decode(response.body)["data"]);
      } else {
        recordList = null;
      }
      return getAPIResult(response, recordList);
    } catch (e) {
      print("Exception - setbooking(): " + e.toString());
    }
  }



  Future<dynamic> changePassword(String user_id, String current_password, String new_password,String confirm_new_password ) async {
    try {
      final response = await http.post(
        Uri.parse("${global.baseUrl}auth/change-password"),
        headers: await global.getApiHeaders(true),
        body: json.encode(
            {
              "user_id": user_id,
              "current_password": current_password,
              "new_password": new_password,
              "confirm_new_password": confirm_new_password


            }

            ),
      );

      dynamic recordList;
      if (response.statusCode == 200 && json.decode(response.body)["resp_code"] == "00") {
        recordList = CurrentUser.fromJson(json.decode(response.body)["data"]);
      } else {
        recordList = null;
      }
      return getAPIResult(response, recordList);
    } catch (e) {
      print("Exception - changePassword(): " + e.toString());
    }
  }


  Future<dynamic> forgotPassword(String user_email) async {
    try {
      final response = await http.post(
        Uri.parse("${global.baseUrl}auth/forget-password"),
        headers: await global.getApiHeaders(false),
        body: json.encode({"email": user_email}),
      );

      dynamic recordList;
      if (response.statusCode == 200 && json.decode(response.body) != null ) {
        recordList = CurrentUser.fromJson(json.decode(response.body)["data"]);
      } else {
        recordList = null;
      }
      return getAPIResult(response, recordList);
    } catch (e) {
      print("Exception - forgotPassword(): " + e.toString());
    }
  }



  Future<dynamic> getAreaList(int id) async {
    try {
      final response = await http.get(
        Uri.parse("${global.baseUrl}location/by-state-area?state_id=$id"),
        headers: await global.getApiHeaders(false),

      );


      dynamic recordList;
      if (response.statusCode == 200 && json.decode(response.body)["resp_code"] == "00") {

        recordList = List<Area>.from(json.decode(response.body)["data"].map((x) => Area.fromJson(x)));



      } else {
        recordList = null;
      }

      return getAPIResult(response, recordList);

    } catch (e) {
      print("Exception - getAllArea " + e.toString());
    }
  }

  Future<dynamic> getAllState() async {
    try {
      final response = await http.get(
        Uri.parse("${global.baseUrl}location/all-state"),
        headers: await global.getApiHeaders(false),

      );


      dynamic recordList;
      if (response.statusCode == 200 && json.decode(response.body)["resp_code"] == "00") {

        recordList = List<States>.from(json.decode(response.body)["data"].map((x) => States.fromJson(x)));



      } else {
        recordList = null;
      }

      return getAPIResult(response, recordList);

    } catch (e) {
      print("Exception - getAllStates: " + e.toString());
    }
  }

  Future<dynamic> loginWithEmail(Loginrequest user) async {
    try {
      final response = await http.post(
        Uri.parse("${global.baseUrl}auth/login"),
        headers: await global.getApiHeaders(false),
        body: json.encode(user),
      );

      dynamic recordList;


      if (response.statusCode == 200 && json.decode(response.body) != null && json.decode(response.body)["data"] != null) {
        // recordList = CurrentUser.fromJson(json.decode(response.body)["data"]["user"]);
        recordList = LoginResponse.fromJson(json.decode(response.body)["data"]);


        // recordList.token = json.decode(response.body)['data']["token_data"]["token"];
      } else {
        recordList = null;
      }
      return getAPIResult(response, recordList);
    } catch (e) {
      print("Exception - loginWithEmail(): " + e.toString());
    }
  }



  Future<dynamic> signUp(SignupRequest user) async {
    try {

      print(json.encode(user));

      final response = await http.post(
        Uri.parse("${global.baseUrl}auth/create"),
        headers: await global.getApiHeaders(false),
        body: json.encode(user),

      );

      dynamic recordList;
      // if(json.decode(response.body)["success"]==false){
      //   recordList = Data.fromJson(json.decode(response.body)["data"]);
      // } else

      if (response.statusCode == 200 && json.decode(response.body) != null && json.decode(response.body)["data"] != null) {


        recordList = SignupData.fromJson(json.decode(response.body)["data"]);


        // recordList.token = json.decode(response.body)['data']["token_data"]["token"];
      }
      else if (response.statusCode == 400)
      {

        // recordList = List<Error>.from(json.decode(response.body)["errors"].map((x) => Error.fromJson(x)));
        return Error.fromJson(json.decode(response.body));



      }

      else {
        recordList = null;
      }
      return getAPIResult(response, recordList);
    } catch (e) {
      print("Exception - signupWithEmail(): " + e.toString());
    }
  }







  Future<dynamic> getSearchResult(int category_id, String title,String state,String city) async {
    try {
      final response = await http.post(
        Uri.parse("${global.baseUrl}user/search"),
        headers: await global.getApiHeaders(true),
        body: json.encode({
          "category_id": category_id,
          "title": title,
          "state": state,
          "city": city

        }),
      );


      dynamic recordList;
      if (response.statusCode == 200 && json.decode(response.body)["resp_code"] == "00") {

        recordList = List<Service>.from(json.decode(response.body)["data"].map((x) => Service.fromJson(x)));



      } else {
        recordList = null;
      }

      return getAPIResult(response, recordList);



    } catch (e) {
      print("Exception - getcategoryResult(): " + e.toString());
    }
  }

  Future<dynamic> getCategoryResult(int category_id) async {
    try {
      final response = await http.post(
        Uri.parse("${global.baseUrl}user/search/category"),
        headers: await global.getApiHeaders(true),
        body: json.encode({
          "category_id": category_id,


        }),
      );


      dynamic recordList;
      if (response.statusCode == 200 && json.decode(response.body)["resp_code"] == "00") {

        recordList = List<Service>.from(json.decode(response.body)["data"].map((x) => Service.fromJson(x)));



      } else {
        recordList = null;
      }

      return getAPIResult(response, recordList);



    } catch (e) {
      print("Exception - getcategoryResult(): " + e.toString());
    }
  }




  // Future<dynamic> addStaffRating(int user_id, int staff_id, double rating, String description) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${global.baseUrl}add_staff_rating"),
  //       headers: await global.getApiHeaders(true),
  //       body: json.encode({
  //         "user_id": user_id,
  //         "staff_id": staff_id,
  //         "rating": rating,
  //         "description": description,
  //       }),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200) {
  //       return getAPIResult(response, recordList);
  //     }
  //   } catch (e) {
  //     print("Exception - addStaffRating(): " + e.toString());
  //   }
  // }






  Future<dynamic> cancelBooking(String cart_id, String reason) async {
    try {
      final response = await http.post(
        Uri.parse("${global.baseUrl}cancel_booking"),
        headers: await global.getApiHeaders(true),
        body: json.encode({"cart_id": cart_id, "reason": reason}),
      );

      dynamic recordList;
      if (response.statusCode == 200) {
        return getAPIResult(response, recordList);
      }
    } catch (e) {
      print("Exception - cancelBooking(): " + e.toString());
    }
  }

  Future<dynamic> cancelOrder(String cart_id, String reason) async {
    try {
      final response = await http.post(
        Uri.parse("${global.baseUrl}cancel_product_orders"),
        headers: await global.getApiHeaders(true),
        body: json.encode({"cart_id": cart_id, "reason": reason}),
      );

      dynamic recordList;
      if (response.statusCode == 200) {
        return getAPIResult(response, recordList);
      }
    } catch (e) {
      print("Exception - cancelOrder(): " + e.toString());
    }
  }



  Future<dynamic> deleteAllNotifications(int user_id) async {
    try {
      final response = await http.post(
        Uri.parse("${global.baseUrl}delete_all_notifications"),
        headers: await global.getApiHeaders(true),
        body: json.encode({"user_id": user_id}),
      );

      dynamic recordList;
      if (response.statusCode == 200) {
        return getAPIResult(response, recordList);
      }
    } catch (e) {
      print("Exception - deleteAllNotifications(): " + e.toString());
    }
  }

  // Future<dynamic> delFromCart(int user_id, int product_id) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${global.baseUrl}del_frm_cart"),
  //       headers: await global.getApiHeaders(true),
  //       body: json.encode({"user_id": user_id, "product_id": product_id}),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = Cart.fromJson(json.decode(response.body)["data"]);
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - delFromCart(): " + e.toString());
  //   }
  // }



  // Future<dynamic> getAllBookings(int user_id) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${global.baseUrl}all_booking"),
  //       headers: await global.getApiHeaders(true),
  //       body: json.encode({"user_id": user_id, "lang": global.languageCode}),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = List<AllBookings>.from(json.decode(response.body)["data"].map((x) => AllBookings.fromJson(x)));
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getAllBookings(): " + e.toString());
  //   }
  // }



  // Future<dynamic> getHopCategory() async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${global.baseUrl}barber_desc"),
  //       headers: await global.getApiHeaders(false),
  //       body: json.encode({"staff_id": staff_id, }),
  //     );
  //
  //     dynamic recordList;
  //
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = PopularBarbers.fromJson(json.decode(response.body)["data"]);
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getBarbersDescription(): " + e.toString());
  //   }
  // }



  // Future<dynamic> getHopCategory() async {
  //   try {
  //     Response response;
  //     var dio = Dio();
  //
  //     response = await dio.get('${global.baseUrl}hop-category',
  //
  //         options: Options(
  //           headers: await global.getApiHeaders(true),
  //         ));
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && response.data["resp_code"] == "00") {
  //       recordList = List<HopCategory>.from(response.data["data"].map((x) => HopCategory.fromJson(x)));
  //     } else {
  //       recordList = null;
  //     }
  //     return getDioResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getCancelReasons(): " + e.toString());
  //   }
  // }





  Future<dynamic> getNotifications(int user_id) async {
    try {
      final response = await http.post(
        Uri.parse("${global.baseUrl}allnotifications"),
        headers: await global.getApiHeaders(true),
        body: json.encode({
          "user_id": user_id,

        }),
      );

      dynamic recordList;
      if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
        recordList = List<Category>.from(json.decode(response.body)["data"].map((x) => Category.fromJson(x)));
      } else {
        recordList = null;
      }
      return getAPIResult(response, recordList);
    } catch (e) {
      print("Exception - getNotifications(): " + e.toString());
    }
  }






  Future<dynamic> geAllHop() async {
    try {
      Response response;
      var dio = Dio();


      response = await dio.get('${global.baseUrl}user/hop-leaders',
          // data: formData,
          options: Options(
            headers: await global.getApiHeaders(true),
          ));

      dynamic recordList;
      if (response.statusCode == 200 && response.data["resp_code"] == "00") {


        recordList = List<CurrentUser>.from(response.data["data"]["data"].map((x) => CurrentUser.fromJson(x)));

      } else {
        recordList = null;
      }
      return getDioResult(response, recordList);



    } catch (e) {
      print("Exception - getReport(): " + e.toString());
    }
  }










  Future<dynamic> getCategory(String id) async {
    try {
      Response response;
      var dio = Dio();


      response = await dio.post('${global.baseUrl}category',

          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200 && response.data["resp_code"] == "00") {


        recordList = List<Category>.from(response.data["data"].map((x) => Category.fromJson(x)));

      } else {
        recordList = null;
      }
      return getDioResult(response, recordList);



    } catch (e) {
      print("Exception - getCategoryReasons(): " + e.toString());
    }
  }
















  Future<dynamic> completeRegistration(int user_id, int area_id) async {
    try {
      final response = await http.post(
        Uri.parse("${global.baseUrl}user/update-setup"),
        headers: await global.getApiHeaders(false),
        body: json.encode({
          "user_id": user_id,
          "area_id": area_id,

        }),
      );


      dynamic recordList;

      if (response.statusCode == 200 && json.decode(response.body)["resp_code"] == "00") {
        recordList = SignupCompleteResponse.fromJson(json.decode(response.body)["data"]);

      } else {
        recordList = null;
      }
      return getAPIResult(response, recordList);



    } catch (e) {
      print("Exception - addStaffRating(): " + e.toString());
    }
  }



  // Future<dynamic> getCurrency() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse("${global.baseUrl}currency"),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = Currency.fromJson(json.decode(response.body)["data"]);
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getCurrency(): " + e.toString());
  //   }
  // }



  // Future<dynamic> getFavoriteList(int user_id) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${global.baseUrl}show_fav"),
  //       headers: await global.getApiHeaders(true),
  //       body: json.encode({"user_id": user_id, "lang": global.languageCode}),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = Favorites.fromJson(json.decode(response.body)["data"]);
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getFavoriteList(): " + e.toString());
  //   }
  // }

  // Future<dynamic> getGoogleMap() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse("${global.baseUrl}google_map"),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = GoogleMapModel.fromJson(json.decode(response.body)["data"]);
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getGoogleMap(): " + e.toString());
  //   }
  // }
  //
  // Future<dynamic> getMapBox() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse("${global.baseUrl}mapbox"),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = MapBoxModel.fromJson(json.decode(response.body)["data"]);
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getMapBox(): " + e.toString());
  //   }
  // }
  //
  // Future<dynamic> getMapGateway() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse("${global.baseUrl}mapby"),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = MapByModel.fromJson(json.decode(response.body)["data"]);
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getMapGateway(): " + e.toString());
  //   }
  // }

  // Future<dynamic> getNearByBanners(String lat, String lng) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${global.baseUrl}getnearbanner"),
  //       headers: await global.getApiHeaders(false),
  //       body: json.encode({
  //         "lat": lat,
  //         "lng": lng,
  //
  //       }),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = List<BannerModel>.from(json.decode(response.body)["data"].map((x) => BannerModel.fromJson(x)));
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getNearByBanners(): " + e.toString());
  //   }
  // }
  //
  // Future<dynamic> getNearByBarberShops(String lat, String lng, int pageNumber, {String searchstring}) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${global.baseUrl}getnearbysalons?page=${pageNumber.toString()}"),
  //       headers: await global.getApiHeaders(false),
  //       body: json.encode({
  //         "lat": lat,
  //         "lng": lng,
  //         "searchstring": searchstring,
  //         "lang": global.languageCode,
  //       }),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = List<BarberShop>.from(json.decode(response.body)["data"].map((x) => BarberShop.fromJson(x)));
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getNearByBarberShops(): " + e.toString());
  //   }
  // }
  //
  // Future<dynamic> getNearByCouponsList(String lat, String lng) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${global.baseUrl}getnearcouponlist"),
  //       headers: await global.getApiHeaders(true),
  //       body: json.encode({"lat": lat, "lng": lng, "lang": global.languageCode}),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = List<Coupons>.from(json.decode(response.body)["data"].map((x) => Coupons.fromJson(x)));
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getNearByCouponsList(): " + e.toString());
  //   }
  // }
  //
  // Future<dynamic> getNotifications(int user_id) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${global.baseUrl}allnotifications"),
  //       headers: await global.getApiHeaders(true),
  //       body: json.encode({
  //         "user_id": user_id,
  //
  //       }),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = List<NotificationList>.from(json.decode(response.body)["data"].map((x) => NotificationList.fromJson(x)));
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getNotifications(): " + e.toString());
  //   }
  // }
  //
  // Future<dynamic> getPaymentGateways() async {
  //   try {
  //     final response = await http.get(Uri.parse("${global.baseUrl}payment_gateways"), headers: await global.getApiHeaders(true));
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = PaymentGateway.fromJson(json.decode(response.body)["data"]);
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getPaymentGateways(): " + e.toString());
  //   }
  // }

  // Future<dynamic> getPopularBarbersList(String lat, String lng, int pageNumber, String searchstring) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${global.baseUrl}popular_barber?page=${pageNumber.toString()}"),
  //       headers: await global.getApiHeaders(false),
  //       body: json.encode({
  //         "lat": lat,
  //         "lng": lng,
  //         "searchstring": searchstring,
  //         "lang": global.languageCode,
  //       }),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = List<PopularBarbers>.from(json.decode(response.body)["data"].map((x) => PopularBarbers.fromJson(x)));
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getPopularBarbersList(): " + e.toString());
  //   }
  // }
  //
  // Future<dynamic> getProductDetails(int product_id) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${global.baseUrl}product_det"),
  //       headers: await global.getApiHeaders(false),
  //       body: json.encode({"product_id": product_id, "user_id": global.user.id, "lang": global.languageCode}),
  //     );
  //
  //     dynamic recordList;
  //
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = ProductDetail.fromJson(json.decode(response.body)["data"]);
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getProductDetails(): " + e.toString());
  //   }
  // }
  //
  // Future<dynamic> getProductOrderHistory() async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${global.baseUrl}product_orders"),
  //       headers: await global.getApiHeaders(true),
  //       body: json.encode({"user_id": global.user.id, }),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = List<ProductOrderHistory>.from(json.decode(response.body)["data"].map((x) => ProductOrderHistory.fromJson(x)));
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getProductOrderHistory(): " + e.toString());
  //   }
  // }
  //
  // Future<dynamic> getProducts(String lat, String lng, int pageNumber, String searchstring) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${global.baseUrl}salon_products?page=${pageNumber.toString()}"),
  //       headers: await global.getApiHeaders(false),
  //       body: json.encode({"lat": lat, "lng": lng, "user_id": global.user.id, "searchstring": searchstring, "lang": global.languageCode}),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = List<Product>.from(json.decode(response.body)["data"].map((x) => Product.fromJson(x)));
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getProducts(): " + e.toString());
  //   }
  // }
  //
  // Future<dynamic> getReferandEarn() async {
  //   try {
  //     Response response;
  //     var dio = Dio();
  //
  //     response = await dio.get('${global.baseUrl}refer_n_earn',
  //
  //         options: Options(
  //           headers: await global.getApiHeaders(true),
  //         ));
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && response.data["status"] == "1") {
  //       recordList = response.data["data"];
  //     } else {
  //       recordList = null;
  //     }
  //     return getDioResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getReferandEarn(): " + e.toString());
  //   }
  // }
  //
  // Future<dynamic> getSalonListForServices(String lat, String lng, String service_name) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${global.baseUrl}service_salons"),
  //       headers: await global.getApiHeaders(false),
  //       body: json.encode({
  //         "lat": lat,
  //         "lng": lng,
  //         "service_name": service_name,
  //
  //       }),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = List<BarberShop>.from(json.decode(response.body)["data"].map((x) => BarberShop.fromJson(x)));
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getNearByBarberShops(): " + e.toString());
  //   }
  // }
  //
  // Future<dynamic> getScratchCards() async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${global.baseUrl}user_scratch_cards"),
  //       headers: await global.getApiHeaders(true),
  //       body: json.encode({
  //         "user_id": global.user.id,
  //
  //       }),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = List<ScratchCard>.from(json.decode(response.body)["data"].map((x) => ScratchCard.fromJson(x)));
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getScratchCards(): " + e.toString());
  //   }
  // }
  //
  // Future<dynamic> getServices(String lat, String lng, int pageNumber, {String searchstring}) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${global.baseUrl}services?page=${pageNumber.toString()}"),
  //       headers: await global.getApiHeaders(false),
  //       body: json.encode({"lat": lat, "lng": lng, "searchstring": searchstring, "lang": global.languageCode}),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = List<Service>.from(json.decode(response.body)["data"].map((x) => Service.fromJson(x)));
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getServices(): " + e.toString());
  //   }
  // }
  //



  Future<dynamic> getTermsAndCondition() async {
    try {
      Response response;
      var dio = Dio();

      response = await dio.get('${global.baseUrl}terms',
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = TermsAndCondition.fromJson(response.data['data']);

      } else {
        recordList = null;
      }
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception - getTermsAndCondition(): " + e.toString());
    }
  }
  //
  // Future<dynamic> getTimeSLot(String selected_date, int staff_id, int vendor_id) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("${global.baseUrl}timeslot"),
  //       headers: await global.getApiHeaders(true),
  //       body: json.encode({
  //         "selected_date": selected_date,
  //         "staff_id": staff_id,
  //         "vendor_id": vendor_id,
  //
  //       }),
  //     );
  //
  //     dynamic recordList;
  //     if (response.statusCode == 200 && json.decode(response.body)["status"] == "1") {
  //       recordList = List<TimeSlot>.from(json.decode(response.body)["data"].map((x) => TimeSlot.fromJson(x)));
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getTimeSLot(): " + e.toString());
  //   }
  // }






  Future<dynamic> getUserProfile(int id) async {
    try {
      final response = await http.post(
        //   Uri.parse("${global.baseUrl}myprofile"),
        Uri.parse("${global.baseUrl}profile"),
        headers: await global.getApiHeaders(true),
        body: json.encode({
          "user_id": id,

        }),
      );

      dynamic recordList;
      if (response.statusCode == 200 && json.decode(response.body)["resp_code"] == "00") {
        //  recordList = CurrentUser.fromJson(json.decode(response.body)["data"]);

        recordList = List<CurrentUser>.from(json.decode(response.body)["data"].map((x) => CurrentUser.fromJson(x)));
        //  recordList.token = json.decode(response.body)["token"];
      } else {
        recordList = null;
      }
      return getAPIResult(response, recordList);
    } catch (e) {
      print("Exception - getUserProfile(): " + e.toString());
    }
  }






  //
  //
  // Future<dynamic> getEventList(int pageNumber, ) async {
  //   try {
  //
  //
  //     final response = await http.get(
  //       Uri.parse("${global.baseUrl}user/events/all?page=${pageNumber.toString()}"),
  //       headers: await global.getApiHeaders(true),
  //       // body: json.encode({
  //       //
  //       //   "searchstring": searchstring,
  //       //
  //       // }),
  //     );
  //
  //     dynamic recordList;
  //
  //     if (response.statusCode == 200 && json.decode(response.body)["resp_code"] == "00") {
  //       recordList = List<Event>.from(json.decode(response.body)["data"]["data"].map((x) => Event.fromJson(x)));
  //     } else {
  //       recordList = null;
  //     }
  //     return getAPIResult(response, recordList);
  //   } catch (e) {
  //     print("Exception - getEventList(): " + e.toString());
  //   }
  // }












  Future<dynamic> submitTestimony({
    String? title,

    String ? desc,
    String? user_id

  }) async {
    try {
      Response response;
      var dio = Dio();







      var formData = FormData.fromMap({
        "user_id":user_id,
        "title": title,
        'desc': desc,
      });



      response = await dio.post('${global.baseUrl}user/testimony/create',
          data: formData,
          options: Options(
            headers: await global.getApiHeaders(true),
          ));
      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = TestimonyResponse.fromJson(response.data['data']);
        //  recordList.token = response.data["token"];
      } else {
        recordList = null;
      }
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception - submittestimony(): " + e.toString());
    }
  }



  Future<dynamic> submitQuestion({


    String ? desc,
    String? user_id

  }) async {
    try {
      Response response;
      var dio = Dio();

      //
      // var formData = FormData.fromMap({
      //   "appKey":"c3488bb4-65b8-47e4-89e4-fd32d6f90179",
      //   "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEwODMwIiwibmJmIjoxNjc3NzA3OTkwLCJleHAiOjE2Nzc3MzY3OTAsImlhdCI6MTY3NzcwNzk5MH0._KpLxbsseow4sn7R3ObJRjICyy_dImI-61tcnoJUPxo",
      //
      // });
      //
      //
      // response = await dio.post('https://test.xpresspayments.com:2033/api/Client/ValidateClient',
      //     data: formData,
      //     options: Options(
      //       headers: await global.getApiHeaders(false),
      //     ));
      //





      var formData = FormData.fromMap({
        "user_id":user_id,
        "title": "Questions Asked",
        'desc': desc,
      });

      response = await dio.post('${global.baseUrl}user/testimony/create',
          data: formData,
          options: Options(
            headers: await global.getApiHeaders(true),
          ));




      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = TestimonyResponse.fromJson(response.data['data']);
        //  recordList.token = response.data["token"];
      } else {
        recordList = null;
      }
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception - submittestimony(): " + e.toString());
    }
  }






  Future<dynamic> signUp2(SignupRequest user) async {
    try {
      Response response;
      var dio = Dio();
      var formData = FormData.fromMap({
        'fullname': user.fullname,
        'email': user.email,
        'phone': user.phone,
        'password': user.password,
        "gender": user.gender,


        "DateOfBirth": user.DateOfBirth,
        "StreetAddress": "null",
        "state": "lagos",
        "city":"Lagos"
        //'device_id': global.appDeviceId,

        // 'fb_id': user.facebook != null ? user.facebook : null,
        // 'user_image': user.user_image != null ? await MultipartFile.fromFile(user.user_image!.path.toString()) : null,

      });

      response = await dio.post('${global.baseUrl}auth/create',
          data: formData,
          options: Options(
            headers: await global.getApiHeaders(false),
          ));
      dynamic recordList;
      if (response.statusCode == 200) {
        // recordList = CurrentUser.fromJson(response.data['data']);
        recordList = SignupData.fromJson(response.data['data']);


      } else {
        recordList = null;
      }
      // return getAPIResult(response.data, recordList);
      return getDioResult(response.data, recordList);


    } catch (e) {
      print("Exception - signUp(): " + e.toString());
    }
  }









  Future<dynamic> updateProfile2(
      int id,
      String user_name,
      File user_image, {
        String? user_password,
      }) async {
    try {
      Response response;
      var dio = Dio();
      var formData = FormData.fromMap({
        'id': id,
        'user_name': user_name,
        'user_password': user_password,

        'user_image': user_image != null ? await MultipartFile.fromFile(user_image.path.toString()) : null,
      });

      response = await dio.post('${global.baseUrl}profile_edit',
          data: formData,
          options: Options(
            headers: await global.getApiHeaders(true),
          ));
      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = CurrentUser.fromJson(response.data['data']);
        recordList.token = response.data["token"];
      } else {
        recordList = null;
      }
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception - updateProfile(): " + e.toString());
    }
  }

  Future<dynamic> verifyOtpAfterLogin(String user_phone, String status, String device_id) async {
    try {
      final response = await http.post(
        Uri.parse("${global.baseUrl}login_verifyotpfirebase"),
        headers: await global.getApiHeaders(false),
        body: json.encode({"user_phone": user_phone, "status": status, "device_id": device_id}),
      );

      dynamic recordList;
      if (response.statusCode == 200 && json.decode(response.body) != null && json.decode(response.body)["data"] != null) {
        recordList = CurrentUser.fromJson(json.decode(response.body)["data"]["user"]);
        recordList.cart_count = json.decode(response.body)['data']["cart_count"];
        recordList.token = json.decode(response.body)["token"];
      } else {
        recordList = null;
      }
      return getAPIResult(response, recordList);
    } catch (e) {
      print("Exception - verifyOtpAfterLogin(): " + e.toString());
    }
  }

  Future<dynamic> verifyOtpAfterRegistration(String user_phone, String status, String referral_code, String device_id) async {
    try {
      final response = await http.post(
        Uri.parse("${global.baseUrl}verify_via_firebase"),
        headers: await global.getApiHeaders(false),
        body: json.encode({"user_phone": user_phone, "status": status, "referral_code": referral_code, "device_id": device_id}),
      );

      dynamic recordList;
      if (response.statusCode == 200 && jsonDecode(response.body)["status"] == "1") {
        recordList = CurrentUser.fromJson(json.decode(response.body)["data"]);
        recordList.token = json.decode(response.body)["token"];
      } else {
        recordList = null;
      }
      return getAPIResult(response, recordList);
    } catch (e) {
      print("Exception - verifyOtpAfterRegistration(): " + e.toString());
    }
  }

  Future<dynamic> verifyOtpForgotPassword(String user_email, String otp) async {
    try {
      final response = await http.post(
        Uri.parse("${global.baseUrl}verify_otp"),
        headers: await global.getApiHeaders(false),
        body: json.encode({"user_email": user_email, "otp": otp}),
      );

      dynamic recordList;
      if (response.statusCode == 200 && jsonDecode(response.body)["status"] == "1") {
        recordList = CurrentUser.fromJson(json.decode(response.body)["data"]);
      } else {
        recordList = null;
      }
      return getAPIResult(response, recordList);
    } catch (e) {
      print("Exception - verifyOtpForgotPassword(): " + e.toString());
    }
  }
}
