import 'dart:io';

import 'package:app_flutter_cocom/controller/penduduk_controller.dart';
import 'package:app_flutter_cocom/controller/user_controller.dart';
import 'package:app_flutter_cocom/models/jawaban_pertanyaan.dart';
import 'package:app_flutter_cocom/models/penduduk.dart';
import 'package:app_flutter_cocom/services/penduduk_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/pertanyaan.dart';
import '../services/pertanyaan_service.dart';
import '../shared/shared.dart';

class PertanyaanController extends GetxController with StateMixin {
  var listPertanyaan = List<Pertanyaan>.empty().obs;
  var userController = Get.find<UserController>();
  var pendudukController = Get.find<PendudukController>();
  var isLoading = false.obs;
  var photoDepan = Rxn<File>();
  var photoBelakang = Rxn<File>();
  var photoKanan = Rxn<File>();
  var photoKiri = Rxn<File>();
  var photoRuangTamu = Rxn<File>();
  var photoRuangTidur = Rxn<File>();
  var photoKamarMandi = Rxn<File>();
  var photoDapur = Rxn<File>();
  var photoKks = Rxn<File>();

  Future<void> getPertanyaan() async {
    change(null, status: RxStatus.loading());
    var result = await PertanyaanServices().getPertanyaan();
    if (result.value != null) {
      listPertanyaan.value = result.value;
      EasyLoading.dismiss();
      change(listPertanyaan, status: RxStatus.success());
    } else {
      EasyLoading.dismiss();
      snackbarCustom(
        title: 'Terjadi Kesalahan',
        message: result.message ?? "No Message",
        typeSnackbar: TypeSnackbar.error,
      );
    }
  }

  void updateJawaban(
      {required Pertanyaan pertanyaan, required JawabanPertanyaan answer}) {
    listPertanyaan.value = listPertanyaan.map((e) {
      if (e.id == pertanyaan.id) {
        return e.copyWith(answer: answer);
      } else {
        return e;
      }
    }).toList();
  }

  Future<void> uploadJawaban(Penduduk penduduk) async {
    List<Pertanyaan> jawabanNull =
        listPertanyaan.where((element) => element.answer == null).toList();
    if (jawabanNull.isNotEmpty) {
      snackbarCustom(
          typeSnackbar: TypeSnackbar.info,
          message: "Harap untuk mengisi seleuruh jawaban terlebih dahulu");
      return;
    }
    if (!(photoDepan.value != null &&
        photoBelakang.value != null &&
        photoKanan.value != null &&
        photoKiri.value != null &&
        photoRuangTamu.value != null &&
        photoRuangTidur.value != null &&
        photoKamarMandi.value != null &&
        photoDapur.value != null &&
        photoKks.value != null)) {
      snackbarCustom(
          typeSnackbar: TypeSnackbar.info,
          message: "Harap untuk melengkapi seluruh foto rumah terlebih dahulu");
      return;
    }
    showLoading();

    List<int> hasilJawaban =
        listPertanyaan.map((element) => element.answer!.poinJawaban!).toList();
    var result = await PertanyaanServices().uploadJawaban(
      user: userController.user.value!,
      listJawaban: hasilJawaban,
      idPenduduk: penduduk.id,
      photoDepan: photoDepan.value,
      photoBelakang: photoBelakang.value,
      photoKanan: photoKanan.value,
      photoDapur: photoDapur.value,
      photoKamarMandi: photoKamarMandi.value,
      photoKiri: photoKiri.value,
      photoKks: photoKks.value,
      photoRuangTamu: photoRuangTamu.value,
      photoRuangTidur: photoRuangTidur.value,
    );
    if (result.value != null) {
      pendudukController.listPenduduk.value =
          pendudukController.listPenduduk.map((element) {
        if (element.id == penduduk.id) {
          return element.copyWith(
            statusSurvey: 'Sudah disurvey',
          );
        } else {
          return element;
        }
      }).toList();
      pendudukController.getPendudukSudahAsesment();
      pendudukController.getPendudukBelumAsesment();
      Get.back(
        result: penduduk.copyWith(
          statusSurvey: 'Sudah disurvey',
        ),
      );
      EasyLoading.dismiss();
      snackbarCustom(
          typeSnackbar: TypeSnackbar.success,
          message: "Assesment telah berhasil dikirimkan");
    } else {
      EasyLoading.dismiss();
      snackbarCustom(
        title: 'Terjadi Kesalahan',
        message: result.message ?? "No Message",
        typeSnackbar: TypeSnackbar.error,
      );
    }
  }

  void getPhoto(BuildContext context, {required String name}) async {
    var resultPhoto = await getSingleImage(
      context,
    );
    if (resultPhoto != null) {
      switch (name) {
        case 'photoDepan':
          photoDepan.value = resultPhoto;
          return;
        case 'photoBelakang':
          photoBelakang.value = resultPhoto;
          return;
        case 'photoKanan':
          photoKanan.value = resultPhoto;
          return;
        case 'photoKiri':
          photoKiri.value = resultPhoto;
          return;
        case 'photoRuangTamu':
          photoRuangTamu.value = resultPhoto;
          return;
        case 'photoRuangTidur':
          photoRuangTidur.value = resultPhoto;
          return;
        case 'photoKamarMandi':
          photoKamarMandi.value = resultPhoto;
          return;
        case 'photoDapur':
          photoDapur.value = resultPhoto;
          return;
        case 'photoKks':
          photoKks.value = resultPhoto;
          return;
        default:
          return;
      }
    }
  }
}
