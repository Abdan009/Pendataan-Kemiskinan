import 'dart:io';

import 'package:app_flutter_cocom/models/pertanyaan.dart';
import 'package:app_flutter_cocom/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/users.dart';
import 'api_return_value.dart';

class PertanyaanServices extends GetConnect {
  Future<ApiReturnValue> getPertanyaan() async {
    timeout = Duration(seconds: maxResponseTime);
    try {
      Response response;

      String url = "$baseUrl/pertanyaan";
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

      List<Pertanyaan> result = (responseData['data'] as Iterable)
          .map(
            (e) => Pertanyaan.fromJson(e),
          )
          .toList();

      return ApiReturnValue(value: result);
    } catch (e) {
      debugPrint('Get Penduduk Error: ${e.toString()}');
      return ApiReturnValue(message: 'Error : ${e.toString()}');
    }
  }

  Future<ApiReturnValue> uploadJawaban({
    required User user,
    required List<int> listJawaban,
    required idPenduduk,
    File? photoDepan,
    File? photoBelakang,
    File? photoKanan,
    File? photoKiri,
    File? photoRuangTamu,
    File? photoRuangTidur,
    File? photoKamarMandi,
    File? photoDapur,
    File? photoKks,
  }) async {
    timeout = Duration(seconds: maxResponseTime);
    try {
      Response response;
      String hasilJawaban = listJawaban.join(',');
      var data = FormData({
        'id_penduduk': idPenduduk,
        'id_opsi_jawaban': hasilJawaban,
        'tanggal': DateTime.now().toIso8601String(),
      });
      if (photoDepan != null) {
        data.files.add(
          MapEntry(
            'photo_depan',
            MultipartFile(
              File(photoDepan.path),
              filename: photoDepan.path.isNotEmpty
                  ? photoDepan.path.split('/').last
                  : '...',
            ),
          ),
        );
      }
      if (photoBelakang != null) {
        data.files.add(
          MapEntry(
            'photo_belakang',
            MultipartFile(
              File(photoBelakang.path),
              filename: photoBelakang.path.isNotEmpty
                  ? photoBelakang.path.split('/').last
                  : '...',
            ),
          ),
        );
      }
      if (photoKanan != null) {
        data.files.add(
          MapEntry(
            'photo_kanan',
            MultipartFile(
              File(photoKanan.path),
              filename: photoKanan.path.isNotEmpty
                  ? photoKanan.path.split('/').last
                  : '...',
            ),
          ),
        );
      }

      if (photoKiri != null) {
        data.files.add(
          MapEntry(
            'photo_kiri',
            MultipartFile(
              File(photoKiri.path),
              filename: photoKiri.path.isNotEmpty
                  ? photoKiri.path.split('/').last
                  : '...',
            ),
          ),
        );
      }

      if (photoRuangTamu != null) {
        data.files.add(
          MapEntry(
            'photo_ruang_tamu',
            MultipartFile(
              File(photoRuangTamu.path),
              filename: photoRuangTamu.path.isNotEmpty
                  ? photoRuangTamu.path.split('/').last
                  : '...',
            ),
          ),
        );
      }
       if (photoRuangTidur != null) {
        data.files.add(
          MapEntry(
            'photo_ruang_tidur',
            MultipartFile(
              File(photoRuangTidur.path),
              filename: photoRuangTidur.path.isNotEmpty
                  ? photoRuangTidur.path.split('/').last
                  : '...',
            ),
          ),
        );
      }
      if (photoKamarMandi != null) {
        data.files.add(
          MapEntry(
            'photo_kamar_mandi',
            MultipartFile(
              File(photoKamarMandi.path),
              filename: photoKamarMandi.path.isNotEmpty
                  ? photoKamarMandi.path.split('/').last
                  : '...',
            ),
          ),
        );
      }
       if (photoDapur != null) {
        data.files.add(
          MapEntry(
            'photo_dapur',
            MultipartFile(
              File(photoDapur.path),
              filename: photoDapur.path.isNotEmpty
                  ? photoDapur.path.split('/').last
                  : '...',
            ),
          ),
        );
      }
       if (photoKks != null) {
        data.files.add(
          MapEntry(
            'photo_kks',
            MultipartFile(
              File(photoKks.path),
              filename: photoKks.path.isNotEmpty
                  ? photoKks.path.split('/').last
                  : '...',
            ),
          ),
        );
      }

      String url = "$baseUrl/hasilSurvey/create";
      response = await post(
        url,
        data,
        headers: {
          "Authorization": "Bearer ${User.token}",
        },
      );
      debugPrint("Request api = ${data.fields}");

      debugPrint("response api = ${response.body}");

      if (response.statusCode != 200) {
        String message = (response.body == null)
            ? "Terjadi kesalahan"
            : response.body['data']['message'];
        return ApiReturnValue(message: message);
      }

      return const ApiReturnValue(value: true);
    } catch (e) {
      debugPrint('Get Penduduk Error: ${e.toString()}');
      return ApiReturnValue(message: 'Error : ${e.toString()}');
    }
  }
}
