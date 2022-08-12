import 'package:app_flutter_cocom/models/penduduk.dart';
import 'package:app_flutter_cocom/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';

import '../models/users.dart';
import 'api_return_value.dart';

class PendudukServices  extends GetConnect {
   Future<ApiReturnValue> getPenduduk({String? status, int? idDistrict}) async {
    timeout = Duration(seconds: maxResponseTime);

    try {
      Response response;

      String url = "$baseUrl/penduduk?${(status!=null)?'status_survey=$status':''}${(idDistrict!=null)?'&district_id=$idDistrict':''}";
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

      List<Penduduk> result = (responseData['data'] as Iterable)
          .map(
            (e) => Penduduk.fromJson(e),
          )
          .toList();

      return ApiReturnValue(value: result);
    } catch (e) {
      debugPrint('Get Penduduk Error: ${e.toString()}');
      return ApiReturnValue(message: 'Error : ${e.toString()}');
    }
  }
}