import 'dart:io';

import 'package:basic_template/common/themes/app_colors.dart';
import 'package:basic_template/common/themes/app_theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// show common alert dialogue according to platform
Future<bool?> showAppAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  String? cancelActionText,
  required String defaultActionText,
  bool isDismissible = true,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: isDismissible,
    builder: (context) => AlertDialog(
      title: Text(
        title,
      ),
      titleTextStyle: AppThemeData.appBarTitleTextStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      content: Text(content),
      actions: <Widget>[
        if (cancelActionText != null)
          TextButton(
            style: TextButton.styleFrom(
              alignment: Alignment.center,
            ).copyWith(
              overlayColor: MaterialStateColor.resolveWith(
                (states) => AppColors.transparent,
              ),
            ),
            child: Text(
              cancelActionText.toUpperCase(),
              style: AppThemeData.dialogueBtnTextStyle.copyWith(
                color: AppColors.secondary600TextColor,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        TextButton(
          style: TextButton.styleFrom(
            alignment: Alignment.center,
          ).copyWith(
            overlayColor: MaterialStateColor.resolveWith(
              (states) => AppColors.transparent,
            ),
          ),
          child: Text(
            defaultActionText.toUpperCase(),
            style: AppThemeData.dialogueBtnTextStyle.copyWith(
              color: AppColors.redTextStatusColor,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    ),
  );
  // if (kIsWeb || Platform.isAndroid) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text(title),
  //       content: Text(content),
  //       actions: <Widget>[
  //         if (cancelActionText != null)
  //           TextButton(
  //             style: TextButton.styleFrom(
  //               alignment: Alignment.center,
  //             ).copyWith(
  //               overlayColor: MaterialStateColor.resolveWith(
  //                   (states) => AppColors.primary10),
  //             ),
  //             child: Text(
  //               cancelActionText,
  //               style: AppThemeData.dialogueBtnTextStyle,
  //             ),
  //             onPressed: () => Navigator.of(context).pop(false),
  //           ),
  //         TextButton(
  //           style: TextButton.styleFrom(
  //             alignment: Alignment.center,
  //           ).copyWith(
  //             overlayColor: MaterialStateColor.resolveWith(
  //                 (states) => AppColors.primary10),
  //           ),
  //           child: Text(
  //             defaultActionText,
  //             style: AppThemeData.dialogueBtnTextStyle,
  //           ),
  //           onPressed: () => Navigator.of(context).pop(true),
  //         ),
  //       ],
  //     ),
  //   );
  // } else {
  //   return showCupertinoDialog(
  //     context: context,
  //     builder: (context) => CupertinoAlertDialog(
  //       title: Text(title),
  //       content: Text(content),
  //       actions: <Widget>[
  //         if (cancelActionText != null)
  //           CupertinoDialogAction(
  //             child: Text(cancelActionText),
  //             onPressed: () => Navigator.of(context).pop(false),
  //           ),
  //         CupertinoDialogAction(
  //           child: Text(defaultActionText),
  //           onPressed: () => Navigator.of(context).pop(true),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
