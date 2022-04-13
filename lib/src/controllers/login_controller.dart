import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:flutter_tik_tok/src/controllers/user_controller.dart';
import 'package:flutter_tik_tok/src/http/http_client.dart';
import 'package:flutter_tik_tok/src/mixins/snack_bar.dart';

class LoginController extends GetxController with HttpClient, SnackBar {

  final UserController userController;

  LoginController({
    required this.userController,
  });

  late String email;
  late String password;

  void login() async {
    final body = jsonEncode({ 'email': email, 'password': password });
    try {
      final response = await callPostApi('/auth/login', body, null);
      await userController.setToken(response.data['token']);
      Get.offAllNamed('/tiktok');
    } on DioError catch(e) {
      if (e.response!.data != null) {
        errorSnackBar(e.response!.data['msg']);
        return;
      }
      errorSnackBar('Failed to login');
    }
  }

  void goToSignUp() {
    Get.offAllNamed('/signup');
  }

}
