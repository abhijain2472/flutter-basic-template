import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// common app color class in which all the color used in app are defined
class AppColors {
  static const Color primary = Color(0xFFfc2a6d);
  static const Color secondary = Color(0xFF4c4cd0);
  static const Color transparent = Colors.transparent;
  static const Color statusBarColor = Colors.white;

  static const Color accent = primary;
  static const Color background_color = Color(0xFFffffff);
  static const Color flushBarBgColor = Color(0xFF303030);
  static const Color scaffold_color = Color(0xFFffffff);
  static const Color icon_color = Colors.black;

  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Colors.grey;

  //text colors
  static const Color redTextStatusColor = Color(0xFFec4d63);
  static const Color greenTextStatusColor = Color(0xFF009681);
  static const Color orangeTextStatusColor = Color(0xFFf78e31);
  static const Color whiteTextColor = Color(0xFFFFFFFF);

  // static const Color blackTextColor = Color(0xFF000000);
  static const Color blackTextColor = Colors.black;

  static const Color todayDateTextColor = Color(0xFF256ff7);
  static const Color primaryTextColor = Color(0xFFfc2a6d);
  static const Color secondaryTextColor = Color(0xFF9AD4D6);
  static const Color secondary600TextColor = Color(0xFF4c4cd0);
  static const Color errorMsgTextColor = redTextStatusColor;
  static const Color greyTextColor = Color(0xFF656973);
  static const Color postActionTextColor = Color(0xFF8a8a8a);

  //shimmer color
  static Color shimmerBaseColor = Colors.grey[300]!;
  static Color shimmerHighlightColor = Colors.grey[050]!;

  // button property
  static const Color btnPrimaryColor = primary;
  static const Color btnGradientStartColor = Color(0xFF256ff7);
  static const Color btnGradientEndColor = Color(0xFF0d56db);
  static const Color btnRippleEffectColor = Colors.white30;
}
