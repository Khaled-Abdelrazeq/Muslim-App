import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarService extends GetxService {
  void showError({required String message, int seconds = 3}) {
    Get.snackbar("Error", message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        duration: Duration(seconds: seconds),
        colorText: Colors.white);
  }

  void showSuccess({required String message, int seconds = 3}) {
    Get.snackbar("Successfully ", message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        duration: Duration(seconds: seconds),
        colorText: Colors.white);
  }
}
