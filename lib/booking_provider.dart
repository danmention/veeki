import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';





final myprovider = ChangeNotifierProvider((ref) =>  AppViewModel());
class AppViewModel    extends ChangeNotifier {

  List<String> _areaList = [];
  int? user_id;
  int calculatedCost =0 ;
  void calculatedamount(int amt) {
    calculatedCost = amt;
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