class DioResult<T> {

  T? data;
  String? resp_code;
  String ?resp_message;
  String ?resp_description;

  DioResult({this.resp_code, this.data});
  DioResult.fromJson(dynamic response, T recordList) {
    try {

      resp_message = response.data['resp_message'];
      resp_description = response.data['resp_description'];
      resp_code = response.data['resp_code'];
      data = recordList;
    } catch (e) {
      print("Exception - dioResult.dart - DioResult.fromJson():" + e.toString());
    }
  }
}
