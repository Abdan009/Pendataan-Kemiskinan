import 'package:app_flutter_cocom/models/district.dart';
import 'package:app_flutter_cocom/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/users.dart';
import 'api_return_value.dart';

class DistrictServices extends GetConnect{
   Future<ApiReturnValue> getDistricts() async {
    timeout = Duration(seconds: maxResponseTime);

    try {
      Response response;

      String url = "$baseUrl/list_district";
      response = await get(
        url,
        headers: {
          "Authorization": "Bearer ${User.token}",
        },
      );
      debugPrint("response api = ${response.body}");

      if (response.statusCode != 200) {
        String message = (response.body == null)
            ? "Terjadi kesalahan"
            : response.body['data']['message'];
        return ApiReturnValue(message: message);
      }
      var responseData = response.body;

      List<District> result = (responseData['data'] as Iterable)
          .map(
            (e) => District.fromJson(e),
          )
          .toList();

      return ApiReturnValue(value: result);
    } catch (e) {
      debugPrint('Get District Error: ${e.toString()}');
      return ApiReturnValue(message: 'Error : ${e.toString()}');
    }
  }
}