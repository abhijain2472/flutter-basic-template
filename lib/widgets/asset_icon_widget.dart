import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_gesture_detector.dart';

/// common svg icon widget with on tap functionality
class AssetIconWidget extends StatelessWidget {
  final String icon;
  final Function? onTap;
  final Color? color;
  final double? height;
  final double? width;
  final EdgeInsets margin;

  const AssetIconWidget({
    Key? key,
    required this.icon,
    this.onTap,
    this.color,
    this.height = 20,
    this.width = 20,
    this.margin = const EdgeInsets.all(0.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: onTap != null
          ? AppGestureDetector(
              child: mainContentWidget(),
              onTap: onTap != null ? onTap! : () {},
            )
          : mainContentWidget(),
    );
  }

  Widget mainContentWidget() {
    return icon.contains(".svg")
        ? SvgPicture.asset(
            icon,
            color: color != null ? color! : null,
            width: width != null ? width! : null,
            height: height != null ? height! : null,
          )
        : Image.asset(
            icon,
            color: color != null ? color! : null,
            width: width != null ? width! : null,
            height: height != null ? height! : null,
          );
  }
}
