import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yss_app/app/common/themes/default_theme.dart';

enum NotificationType {
  info,
  warning,
  error,
  success,
}

extension ColorExtension on NotificationType {
  Color get color {
    switch (this) {
      case NotificationType.info:
        return DefaultTheme.infoColor;
      case NotificationType.warning:
        return DefaultTheme.warningColor;
      case NotificationType.error:
        return DefaultTheme.errorColor;
      case NotificationType.success:
        return DefaultTheme.successColor;
      default:
        return Colors.black;
    }
  }
}

extension IconDataExtension on NotificationType {}

extension NotificationTypeExtension on NotificationType {
  IconData get icon {
    switch (this) {
      case NotificationType.info:
        return MdiIcons.informationOutline;
      case NotificationType.warning:
        return MdiIcons.alertOutline;
      case NotificationType.error:
        return MdiIcons.alertCircleOutline;
      case NotificationType.success:
        return MdiIcons.checkCircleOutline;
      default:
        return Icons.error;
    }
  }

  String get value {
    switch (this) {
      case NotificationType.info:
        return 'info';
      case NotificationType.warning:
        return 'warning';
      case NotificationType.error:
        return 'error';
      case NotificationType.success:
        return 'success';
      default:
        return "";
    }
  }

  static NotificationType fromString(String value) {
    switch (value) {
      case 'info':
        return NotificationType.info;
      case 'warning':
        return NotificationType.warning;
      case 'error':
        return NotificationType.error;
      case 'success':
        return NotificationType.success;
      default:
        return NotificationType.info;
    }
  }
}
