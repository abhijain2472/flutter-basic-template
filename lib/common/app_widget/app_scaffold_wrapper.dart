import 'package:basic_template/common/themes/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// app scaffold wrapper used in all screen
class AppScaffoldWrapper extends StatelessWidget {
  final Color statusColor;
  final WillPopCallback? isPopFun;
  final Widget child;
  final top;
  final bottom;

  const AppScaffoldWrapper({
    Key? key,
    this.isPopFun,
    this.statusColor = AppColors.statusBarColor,
    required this.child,
    this.top = true,
    this.bottom = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kIsWeb ? null : this.statusColor,
      child: SafeArea(
        bottom: bottom,
        top: top,
        child: WillPopScope(
          onWillPop:
              isPopFun == null ? () => Future.value(true) : this.isPopFun,
          child: this.child,
        ),
      ),
    );
  }
}
