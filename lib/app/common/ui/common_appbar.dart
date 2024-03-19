import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yss_app/app/common/themes/default_theme.dart';
import 'package:yss_app/app/common/ui/common_avatar.dart';
import 'package:yss_app/app/routes/app_pages.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        // shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Get.theme.primaryColor.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 1,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Get.theme.colorScheme.background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // circle pickure and name between notification and search

          CommonAvatar(
            radius: 20,
            imageUrl:
                'https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png',
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello, User',
                style: Get.textTheme.labelLarge,
              ),
              Text(
                'Trash Collector',
                style: Get.textTheme.bodySmall,
              )
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.NOTIFICATION);
            },
            icon: Badge(
              label: Text(
                '3',
                style: Get.textTheme.bodySmall!.copyWith(
                  color: DefaultTheme.base100Color,
                ),
              ),
              offset: const Offset(0, 0),
              backgroundColor: Get.theme.primaryColor,
              child: const Icon(
                Icons.notifications,
                size: 30,
              ),
            ),
            color: DefaultTheme.base900Color,
          ),
        ],
      ),
    );
  }
}
