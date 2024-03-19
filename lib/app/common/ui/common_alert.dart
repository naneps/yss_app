import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yss_app/app/common/themes/default_theme.dart';

enum AlertType { info, warning, error, success }

class CommonAlert extends StatelessWidget {
  final String message;
  AlertType? type;
  CommonAlert({
    super.key,
    required this.message,
    this.type = AlertType.info,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: type!.color,
      ),
      child: Row(
        children: [
          Icon(
            type!.icon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              message,
              style: Get.textTheme.labelMedium!.copyWith(
                  // color: Colors.white,
                  ),
            ),
          )
        ],
      ),
    );
  }
}

extension AlertTypeExtension on AlertType {
  Color get color {
    switch (this) {
      case AlertType.info:
        return DefaultTheme.infoColor;
      case AlertType.warning:
        return DefaultTheme.warningColor;
      case AlertType.error:
        return DefaultTheme.errorColor;
      case AlertType.success:
        return DefaultTheme.successColor;
      default:
        return DefaultTheme.infoColor;
    }
  }

  IconData get icon {
    switch (this) {
      case AlertType.info:
        return MdiIcons.informationOutline;
      case AlertType.warning:
        return MdiIcons.alertOutline;
      case AlertType.error:
        return MdiIcons.alertCircleOutline;
      case AlertType.success:
        return MdiIcons.checkCircleOutline;
      default:
        return MdiIcons.informationOutline;
    }
  }
}
