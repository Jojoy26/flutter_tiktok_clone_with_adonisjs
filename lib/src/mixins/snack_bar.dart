import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin SnackBar {
  void sucessSnackBar(String message) {
    Get.snackbar(
      'Sucess', 
      message,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(10),
      colorText: Colors.white,
    );
  }

  void errorSnackBar(String message) {
    Get.snackbar(
      'Error', 
      message,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(10),
      colorText: Colors.white
    );
  }
}