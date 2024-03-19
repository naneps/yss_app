import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yss_app/app/modules/home/views/home_view.dart';
import 'package:yss_app/app/modules/profile/views/profile_view.dart';
import 'package:yss_app/app/modules/social/views/social_view.dart';
import 'package:yss_app/app/modules/task/views/task_view.dart';
import 'package:yss_app/app/routes/app_pages.dart';

class BottomNavItem {
  final String label;
  final IconData icon;
  final IconData activeIcon;
  final String route;
  BottomNavItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.route,
  });
}

class CoreController extends GetxController {
  //TODO: Implement CoreController
  RxList<Widget> pages = <Widget>[
    const HomeView(),
    const TaskView(),
    const SocialView(),
    const ProfileView(),
  ].obs;
  RxList<BottomNavItem> bottomNavItems = <BottomNavItem>[
    BottomNavItem(
      label: 'Home',
      icon: MdiIcons.homeCity,
      activeIcon: MdiIcons.homeCityOutline,
      route: Routes.HOME,
    ),
    BottomNavItem(
      label: 'Task',
      icon: MdiIcons.clipboardList,
      activeIcon: MdiIcons.clipboardListOutline,
      route: Routes.TASK,
    ),
    BottomNavItem(
      label: 'Social',
      icon: MdiIcons.accountGroup,
      activeIcon: MdiIcons.accountGroupOutline,
      route: Routes.SOCIAL,
    ),
    BottomNavItem(
      label: 'Profile',
      icon: MdiIcons.account,
      activeIcon: MdiIcons.accountOutline,
      route: Routes.PROFILE,
    ),
  ].obs;
  final pageController = PageController();
  RxInt currentIndex = 0.obs;
  void changePage(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }
}
