import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yss_app/app/routes/app_pages.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
  RxBool showPassword = false.obs;
  final storage = GetStorage();
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  void login() {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.offNamed(Routes.CORE);
      storage.write('isLogged', true);
    });
  }
}
