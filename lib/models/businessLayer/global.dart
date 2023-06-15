import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../response/login_response.dart';
import '../userModel.dart';





String? appDeviceId;
String appName = 'Veeki';
String appShareMessage = "I'm inviting you to use $appName, a simple and easy app to find saloon services and products near by your location. Here's my code [CODE] - jusy enter it while registration.";
String appVersion = '1.0';
String baseUrl = 'https://api.veeki.co/api/';
String  publicKey = 'pk_test_59b09788900a513d57d5b280c1225ee6616a8ce2';
//Currency currency = Currency();

//String currentLocation;
String googleAPIKey = "place your google key here.";
bool isRTL = false;
String? currentLocation;
String? lat;
String? lng;
bool isGoogleMap = false;
// MapBoxModel mapBoxModel = new MapBoxModel();
// GoogleMapModel mapGBoxModel = new GoogleMapModel();

SharedPreferences? sp;
LoginResponse loginResponse = new LoginResponse();
CurrentUser user = new CurrentUser();

TokenData token = TokenData();

Future<Map<String, String>> getApiHeaders(bool authorizationRequired) async {
  Map<String, String> apiHeader = new Map<String, String>();
  if (authorizationRequired) {
    sp = await SharedPreferences.getInstance();
    if (sp!.getString("currentUser") != null) {

      user = CurrentUser.fromJson(json.decode(sp!.getString("currentUser")??" "));
      TokenData token = TokenData.fromJson(json.decode(sp!.getString("currentToken")??" "));



      print(token.token.toString());

      apiHeader.addAll({"Authorization": "Bearer" + token.token.toString()});
    }
  }
  apiHeader.addAll({"Content-Type": "application/json"});
  apiHeader.addAll({"Accept": "application/json"});
  return apiHeader;
}

Future<String> getDeviceId() async {
  String deviceId =" ";
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    deviceId = androidDeviceInfo.id;
  } else if (Platform.isIOS) {
    IosDeviceInfo androidDeviceInfo = await deviceInfo.iosInfo;
    deviceId = androidDeviceInfo.identifierForVendor!;
  }
  return deviceId;
}
