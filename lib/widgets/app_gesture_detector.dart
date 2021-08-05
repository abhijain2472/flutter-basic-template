import 'package:basic_template/common/themes/context_global_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// common gesture detector used in all place which remove focus first on button tap
class AppGestureDetector extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final Function? onLongTap;

  const AppGestureDetector({
    Key? key,
    required this.child,
    required this.onTap,
    this.onLongTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: child,
      onTap: () {
        ContextGlobalMethod.hideGlobalKb(context);
        onTap();
      },
      onLongPress: onLongTap != null
          ? () {
              HapticFeedback.vibrate();
              onLongTap!();
            }
          : null,
    );
  }
}
