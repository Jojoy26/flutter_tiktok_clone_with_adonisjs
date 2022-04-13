import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:flutter_tik_tok/src/controllers/flutter_secure_storage_controller.dart';
import 'package:flutter_tik_tok/src/controllers/user_controller.dart';
import 'package:flutter_tik_tok/src/http/http_client.dart';

class SplashController with HttpClient {

  final FlutterSecureStorageController storageController;
  final UserController userController;
  SplashController({
    required this.storageController,
    required this.userController,
  });

  Future getCurrentUser() async {
    await Future.delayed(Duration(seconds: 2));
    String? token = await storageController.readToken();

    if (token == null) {
      Get.offAllNamed('/login');
      return;
    }
    
    userController.setToken(token);
    try {
      final response = await callGetApi('/auth/verify', null, userController.user.toHeader());
      Get.offAllNamed('/tiktok');
    } on DioError catch(e) {
      if (e.response!.statusCode == 401) {
        await storageController.deleteToken();
      }
      Get.offAllNamed('/login');
    }

  }

}
