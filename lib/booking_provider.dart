import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'package:veeki/models/response/service_response.dart';

import 'models/request/booking_request.dart';
import 'models/response/service_response.dart';
import 'models/response/service_response.dart';
import 'models/response/service_response.dart';




final myprovider = ChangeNotifierProvider((ref) =>  AppViewModel());
class AppViewModel    extends ChangeNotifier {

  List<String> _areaList = [];
  int? user_id;
  int calculatedCost =0 ;
  int? initialAmount ;
  String? caregiver ;
  Service bookedService = Service();

  BookingRequest  bookingRequestitem = BookingRequest();

  String usertype(){
    if(global.user.role=="SERVICE_PROVIDER"){
      return "Caregiver";
    }else{
      return 'USER';
    }

  }
  void calculatedamount(int amt) {
    calculatedCost = amt;
    notifyListeners();
  }

  void initamount(int amt) {
    initialAmount = amt;
    notifyListeners();
  }

  void addService(Service service) {
    bookedService = service;
    notifyListeners();
  }

  void addBookingRequest(BookingRequest bookingRequest) {
    bookingRequestitem = bookingRequest;
    notifyListeners();
  }


  int getUserId(){
    notifyListeners();
    return user_id!;

  }



  List<String> getArea() {

    notifyListeners();
    return _areaList ;
  }







}