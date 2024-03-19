// import 'package:flutter/material.dart';

// class CommonDialog extends StatelessWidget {
//   final String? title;
//   final String? middleText;
//   final Function? onConfirm;
//   final Function? onCancel;
//   final String? confirmText;
//   final String? cancelText;
//   final bool? showCancel;

//   const CommonDialog({
//     Key key,
//     this.title,
//     this.middleText,
//     this.onConfirm,
//     this.onCancel,
//     this.confirmText,
//     this.cancelText,
//     this.showCancel = true,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(titleLarge),
//       content: Text(middleText),
//       actions: <Widget>[
//         if (showCancel)
//           TextButton(
//             onPressed: onCancel,
//             child: Text(cancelText ?? 'Cancel'),
//           ),
//         TextButton(
//           onPressed: onConfirm,
//           child: Text(confirmText ?? 'OK'),
//         ),
//       ],
//     );
//   }
// }
