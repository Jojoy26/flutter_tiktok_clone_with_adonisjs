import 'dart:io';

import 'package:flutter_tik_tok/src/http/http_client.dart';
import 'package:flutter_tik_tok/src/mixins/snack_bar.dart';
import 'package:get/get.dart';

import 'package:flutter_tik_tok/src/controllers/user_controller.dart';
import 'package:dio/dio.dart' as dio;

class CreateVideoController extends GetxController with HttpClient, SnackBar {

  final UserController userController;
  CreateVideoController({
    required this.userController,
  });

  RxBool isLoading = false.obs;

  void uploadVideo(File video, void Function() onSucess) async {
    isLoading.value = true;
    dio.FormData body = dio.FormData.fromMap({
      'video': await dio.MultipartFile.fromFile(video.path,),
    });

    try {
      final response = await callPostApi('/video/create', body, userController.user.toHeader());
      onSucess();
      sucessSnackBar('Video uploaded successfully');
    } on dio.DioError catch(e) {
      errorSnackBar('Failed to upload video');
    }
    isLoading.value = false;
  }

}
