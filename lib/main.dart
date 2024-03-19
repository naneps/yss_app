import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yss_app/app/common/themes/default_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      title: "YUBI SUPPORT SYSTEM",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      onInit: () {
        GetStorage().writeIfNull('isLogged', false);
      },
      onReady: () {
        GetStorage().read('isLogged') == true
            ? Get.offNamed(Routes.CORE)
            : Get.offNamed(Routes.AUTH);
      },
      getPages: AppPages.routes,
      theme: DefaultTheme.theme,
    ),
  );
}
