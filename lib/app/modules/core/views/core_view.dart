import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yss_app/app/common/themes/default_theme.dart';

import '../controllers/core_controller.dart';

class CoreView extends GetView<CoreController> {
  const CoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.white,
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          selectedItemColor: Get.theme.primaryColor,
          unselectedItemColor: DefaultTheme.base900Color.withOpacity(0.2),
          items: [
            ...controller.bottomNavItems.map(
              (e) => BottomNavigationBarItem(
                icon: Icon(e.icon),
                activeIcon: Icon(e.activeIcon),
                label: e.label,
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () => PageView(
          pageSnapping: true,
          padEnds: true,
          scrollBehavior: const MaterialScrollBehavior(),
          allowImplicitScrolling: true,
          physics: const BouncingScrollPhysics(),
          onPageChanged: controller.changePage,
          controller: controller.pageController,
          children: controller.pages.toList(),
        ),
      ),
    );
  }
}
