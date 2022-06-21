import 'package:dio/dio.dart';

class SurveyServices {
  Future<void> getSurvey() async {
    try {
      var response = await Dio().get('http://www.google.com');
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
