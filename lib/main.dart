import 'package:app_flutter_cocom/pages/home/home_page.dart';
import 'package:app_flutter_cocom/pages/login/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: const Home_Page());
  }
}
