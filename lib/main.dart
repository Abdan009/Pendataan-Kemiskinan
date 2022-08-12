import 'package:app_flutter_cocom/pages/home/home_page.dart';
import 'package:app_flutter_cocom/pages/login/login.dart';
import 'package:app_flutter_cocom/pages/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (_, widget){
        return  EasyLoading.init()(context, widget);
      },
      home:  WrapperPage(),
    );
  }
}
