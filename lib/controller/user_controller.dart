import 'dart:io';

import 'package:app_flutter_cocom/pages/home/home_page.dart';
import 'package:app_flutter_cocom/pages/login/login.dart';
import 'package:app_flutter_cocom/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/users.dart';
import '../shared/shared.dart';

class UserController extends GetxController with StateMixin {
  var user = Rxn<User>();
  final box = GetStorage();

  Future<void> login(
      {required String email, required String password}) async {
    change(null, status: RxStatus.loading());
    showLoading();

    var result =
        await UserServices().login(email: email, password: password);
    if (result.value != null) {
      user.value = result.value;
      box.write('token', User.token);
      box.write('password', password);
      user.refresh();
      EasyLoading.dismiss();
      change(user, status: RxStatus.success());
      debugPrint("${user.value!.role}");
      Get.offAll(() => const HomePage());
    } else {
      EasyLoading.dismiss();
      snackbarCustom(
        title: 'Masuk Gagal',
        message: result.message ?? "No Message",
        typeSnackbar: TypeSnackbar.error,
      );
    }
  }

  Future<void> getUser() async {
    var result = await UserServices().getUser();
    if (result.value != null) {
      user.value = result.value;
      user.refresh();
      change(user, status: RxStatus.success());
    } else {
      throw Exception("Error on server");
    }
  }

  Future<void> logout() async {
    showLoading();
     await box.remove('token');
      user.value = User();
      EasyLoading.dismiss();

      Get.offAll(() => const LoginPage());
            EasyLoading.dismiss();
    // await box.remove('token');
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
