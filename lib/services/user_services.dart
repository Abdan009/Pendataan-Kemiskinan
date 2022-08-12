import 'dart:async';
import 'dart:io';

import 'package:app_flutter_cocom/services/api_return_value.dart';
import 'package:app_flutter_cocom/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/users.dart';

class UserServices extends GetConnect {
  final box = GetStorage();


  Future<ApiReturnValue> login(
      {required String email, required String password}) async {
    timeout = Duration(seconds: maxResponseTime);

    try {
      Response response;
      var data = FormData({
        'email': email,
        'password': password,
      });

      String url = "$baseUrl/login";
      response = await post(
        url,
        data,
      );
      debugPrint("Data Push = ${data.fields}");
      debugPrint("response api = ${response.body}");

      if (response.statusCode != 200) {
        String message = (response.body == null)
            ? "Terjadi kesalahan"
            : response.body['data']['message'];
        return ApiReturnValue(message: message);
      }
      var responseData = response.body;
      debugPrint(responseData.toString());
      User.token = responseData['data']['user']['id'];

      User result = User.fromJson(responseData['data']['user']);
      return ApiReturnValue(value: result);
    } catch (e) {
      debugPrint('Login User Error: ${e.toString()}');
      return ApiReturnValue(message: 'Error : ${e.toString()}');
    }
  }

  Future<ApiReturnValue> getUser() async {
    timeout = Duration(seconds: maxResponseTime);

    try {
      Response response;
      User.token = box.read('token');

      String url = "$baseUrl/user/all?id=${User.token}";
      response = await get(
        url,
        headers: {
          "Authorization": "Bearer ${User.token}",
        },
      );
      debugPrint("response api user = " + response.body.toString());

      if (response.statusCode != 200) {
        String message = (response.body == null)
            ? "Terjadi kesalahan"
            : response.body['data']['message'];
        return ApiReturnValue(message: message);
      }
      var responseData = response.body;

      User result = User.fromJson(responseData['data']);

      return ApiReturnValue(value: result);
    } catch (e) {
      debugPrint('Get User Error: ${e.toString()}');
      return ApiReturnValue(message: 'Error : ${e.toString()}');
    }
  }

  Future<ApiReturnValue> logout() async {
    timeout = Duration(seconds: maxResponseTime);

    Response response;

    String url = "";
    try {
      response = await delete(
        url,
        headers: {
          "Authorization": "Bearer ${User.token}",
        },
      );
      debugPrint("url=$url\n response api= ${response.body.toString()}");

      if (response.statusCode != 200) {
        String message = (response.body == null)
            ? "Terjadi kesalahan"
            : response.body['data']['message'];
        return ApiReturnValue(message: message);
      }

      return const ApiReturnValue(value: true);
    } catch (e) {
      debugPrint('url=$url\n Logout User Error: ${e.toString()}');
      return ApiReturnValue(message: 'Error : ${e.toString()}');
    }
  }



  Future<ApiReturnValue> updatePhotoProfile(File file) async {
    timeout = Duration(seconds: maxResponseTime);

    try {
      Response response;
      User.token = box.read('token');
      var data =  FormData({
        'file': MultipartFile(
          File(file.path),
          filename: file.path.isNotEmpty ? file.path.split('/').last : '...',
        ),
      });

      String url = "";
      response = await post(
        url,
        data,
        headers: {
          "Authorization": "Bearer ${User.token}",
        },
      );
      debugPrint("response api = " + response.body.toString());

      if (response.statusCode != 200) {
        String message = (response.body == null)
            ? "Terjadi kesalahan"
            : response.body['data']['message'];
        return ApiReturnValue(message: message);
      }
      var responseData = response.body;

      User userResult = User.fromJson(responseData['data']);
      debugPrint("After Update");
      debugPrint(userResult.toString());

      return  ApiReturnValue(value: userResult);
    } catch (e) {
      debugPrint('Update User Error: ${e.toString()}');
      return ApiReturnValue(message: 'Error : ${e.toString()}');
    }
  }
}
