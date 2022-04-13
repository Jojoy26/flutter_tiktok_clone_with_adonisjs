import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_tik_tok/src/http/http_client.dart';
import 'package:flutter_tik_tok/src/mixins/snack_bar.dart';
import 'package:flutter_tik_tok/src/models/video_model.dart';
import 'package:get/get.dart';

import 'package:flutter_tik_tok/src/controllers/user_controller.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController with HttpClient, SnackBar {
  
  final UserController userController;
  HomeController({
    required this.userController,
  });

  RxList<Rx<VideoModel>> videosList = <Rx<VideoModel>>[].obs;
  RxBool isLoading = true.obs;
  RxBool hasError = false.obs;
  
  void getVideos() async {
    isLoading.value = true;
    try {
      final response = await callGetApi('/video', null, userController.user.toHeader());
      videosList.value = (response.data as List).map((e) => VideoModel.fromMap(e).obs).toList();
    } on DioError catch(e) {
      hasError.value = true;
    }
    isLoading.value = false;
  }

  void like(int videoIndex) async {
    final body = jsonEncode({ 'video_id': videosList[videoIndex].value.id });
    try {
      final response = await callPostApi('/video/like', body, userController.user.toHeader());
      videosList[videoIndex].update((val) {
        val!.isLiked = !val.isLiked;
        if (val.isLiked) {
          val.likeCount = val.likeCount + 1;
        } else {
          val.likeCount = val.likeCount - 1;
        }
      });
    } on DioError catch(e) {
      errorSnackBar('Failed to perform action');
    }
  }
}

