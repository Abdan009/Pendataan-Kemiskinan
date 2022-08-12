import 'dart:io';

import 'package:app_flutter_cocom/models/district.dart';
import 'package:app_flutter_cocom/models/penduduk.dart';
import 'package:app_flutter_cocom/pages/home/home_page.dart';
import 'package:app_flutter_cocom/pages/login/login.dart';
import 'package:app_flutter_cocom/services/district_services.dart';
import 'package:app_flutter_cocom/services/penduduk_services.dart';
import 'package:app_flutter_cocom/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:haversine_distance/haversine_distance.dart';

import '../models/users.dart';
import '../shared/shared.dart';

class PendudukController extends GetxController with StateMixin {
  var listPenduduk = List<Penduduk>.empty().obs;
  var listDistrict = List<District>.empty().obs;
  var listSudahAssesment = List<Penduduk>.empty().obs;
  var listBelumAssesment = List<Penduduk>.empty().obs;
  var selectedDistrict = Rxn<District>();
  var isLoadingGetDistrict = false.obs;

  Future<void> getPenduduk(LatLng coordinate,
      {String? status, int? idDistrict}) async {
    // change(null, status: RxStatus.loading());
    var result = await PendudukServices()
        .getPenduduk(status: status, idDistrict: idDistrict);
    if (result.value != null) {
      listPenduduk.value = result.value;
      final haversineDistance = HaversineDistance();

      listPenduduk.value = listPenduduk.map((element) {
        double distance = haversineDistance.haversine(
            Location(coordinate.latitude, coordinate.longitude),
            Location(double.parse(element.longitude!),
                double.parse(element.latitude!)),
            Unit.KM);
        return element.copyWith(distance: distance);
      }).toList();

      listPenduduk.sort((a, b) => a.distance!.compareTo(b.distance!));

      EasyLoading.dismiss();
      change(listPenduduk, status: RxStatus.success());
    } else {
      EasyLoading.dismiss();
      snackbarCustom(
        title: 'Terjadi Kesalahan',
        message: result.message ?? "No Message",
        typeSnackbar: TypeSnackbar.error,
      );
    }
  }

  Future<void> getInitData() async {
    change(null, status: RxStatus.loading());
    await getPendudukBelumAsesment();
    await getPendudukSudahAsesment();
    change(listSudahAssesment, status: RxStatus.success());
  }

  Future<void> getPendudukBelumAsesment() async {
    var result = await PendudukServices().getPenduduk(status: 'Belum disurvey');
    if (result.value != null) {
      listBelumAssesment.value = result.value;
    } else {
      snackbarCustom(
        title: 'Terjadi Kesalahan',
        message: result.message ?? "No Message",
        typeSnackbar: TypeSnackbar.error,
      );
    }
  }

  Future<void> getPendudukSudahAsesment() async {
    var result = await PendudukServices().getPenduduk(status: 'Sudah disurvey');
    if (result.value != null) {
      listSudahAssesment.value = result.value;
    } else {
      snackbarCustom(
        title: 'Terjadi Kesalahan',
        message: result.message ?? "No Message",
        typeSnackbar: TypeSnackbar.error,
      );
    }
  }

  Future<void> getDistrict() async {
    isLoadingGetDistrict.value = true;
    var result = await DistrictServices().getDistricts();
    isLoadingGetDistrict.value = false;

    if (result.value != null) {
      listDistrict.value = result.value;
    } else {
      snackbarCustom(
        title: 'Terjadi Kesalahan',
        message: result.message ?? "No Message",
        typeSnackbar: TypeSnackbar.error,
      );
    }
  }

  // Future<void> updateProfile(User userRequest) async {
  //   showLoading();
  //   var result = await UserServices().updateProfile(userRequest);
  //   if (result.value != null) {
  //     debugPrint(
  //         "Name Before Update ${(result.value as User).name}  ${(result.value as User).username}");
  //     user.value = result.value;

  //     EasyLoading.dismiss();
  //     snackbarCustom(
  //       typeSnackbar: TypeSnackbar.success,
  //       title: 'Data Berhasil Disimpan',
  //       message: 'Data telah berhasil disimpan',
  //     );
  //   } else {
  //     EasyLoading.dismiss();
  //     snackbarCustom(
  //       typeSnackbar: TypeSnackbar.error,
  //       title: 'Terjadi Kesalahan',
  //       message: result.message!,
  //     );
  //   }
  // }
}
