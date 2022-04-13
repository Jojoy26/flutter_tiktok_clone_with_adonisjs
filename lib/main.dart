import 'package:flutter/material.dart';
import 'package:flutter_tik_tok/injection_setup.dart';
import 'package:flutter_tik_tok/src/pages/login/login.dart';
import 'package:flutter_tik_tok/src/pages/signUp/sign_up.dart';
import 'package:flutter_tik_tok/src/pages/splash/splash.dart';
import 'package:flutter_tik_tok/src/pages/tiktok/tiktok.dart';
import 'package:get/get.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashPage(),
      getPages: [
        GetPage(name: '/splash', page: () => SplashPage()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/signup', page: () => SignUpPage()),
        GetPage(name: '/tiktok', page: () => TikTokPage())
      ],
    );
  }
}