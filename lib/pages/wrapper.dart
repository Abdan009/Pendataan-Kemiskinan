import 'package:app_flutter_cocom/controller/user_controller.dart';
import 'package:app_flutter_cocom/pages/home/home_page.dart';
import 'package:app_flutter_cocom/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WrapperPage extends StatelessWidget {
   WrapperPage({Key? key}) : super(key: key);
  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    var box = GetStorage();
    return (box.read('token') != null) ? Builder(
      builder: (context) {
        userController.getUser();
        return const HomePage();
      }
    ) : const LoginPage();
  }
}
