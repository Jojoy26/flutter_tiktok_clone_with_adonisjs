import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_tik_tok/src/http/http_client.dart';
import 'package:flutter_tik_tok/src/mixins/snack_bar.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController with HttpClient, SnackBar {

  late File profileImage;
  late String email;
  late String password;
  late String username;

  void signUp() async {
    dio.FormData body = dio.FormData.fromMap({
      'profile_image': await dio.MultipartFile.fromFile(profileImage.path,),
      'email': email,
      'password': password,
      'username': username
    });

    try {
      final response = await callPostApi('/auth/signup', body, null);
      sucessSnackBar('Sucessfully on create account');
      Get.offAllNamed('/login');
    } on dio.DioError catch(e) {
      if (e.response!.data != null) {
        errorSnackBar(e.response!.data['msg']);
        return;
      }
      errorSnackBar('Failed to create account');
    }
  }

  void goToLogin() {
    Get.offAllNamed('/login');
  }

}
