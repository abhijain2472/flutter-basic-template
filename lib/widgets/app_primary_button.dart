import 'package:basic_template/common/themes/context_global_method.dart';
import 'package:flutter/material.dart';

import '../app_import.dart';

/// common button widget with loader,splash & gradient used in all place in app
class AppPrimaryButtonWidget extends StatelessWidget {
  final String btnText;
  final Function? onPressed;
  final double? btnHeight;
  final double btnWidth;
  final double? borderRadius;
  final double borderWidth;
  final Color borderColor;
  final Color buttonColor;
  final Color textColor;
  final TextStyle? textStyle;
  final Widget? rightIcon;
  final Widget? leftIcon;
  final bool isGradientButton;
  final bool showShadow;
  final double elevation;
  final bool showRippleEffect;
  final EdgeInsets? margin;
  final bool isLoading;
  final Color loaderColor;
  final double rightIconPadding;
  final double leftIconPadding;
  final bool isDisabled;
  final Color splashColor;

  AppPrimaryButtonWidget({
    Key? key,
    required this.btnText,
    this.onPressed,
    this.borderRadius,
    this.btnHeight,
    this.borderWidth = 0,
    this.textStyle,
    this.borderColor = AppColors.transparent,
    this.textColor = AppColors.whiteTextColor,
    this.buttonColor = AppColors.btnPrimaryColor,
    this.splashColor = AppColors.btnRippleEffectColor,
    this.btnWidth = double.infinity,
    this.rightIcon,
    this.leftIcon,
    this.isDisabled = false,
    this.isGradientButton = false,
    this.showShadow = false,
    this.elevation = 0.0,
    this.showRippleEffect = true,
    this.isLoading = false,
    this.margin,
    this.loaderColor = AppColors.whiteColor,
    this.leftIconPadding = 8,
    this.rightIconPadding = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Material(
        // <----------------------------- Outer Material
        // shadowColor: Colors.grey[50],

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
        ),
        elevation: elevation,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            color: isGradientButton ? null : buttonColor,
            border: Border.all(
              width: borderWidth,
              color: borderColor,
            ),
            gradient: isGradientButton
                ? LinearGradient(
                    colors: [
                      AppColors.btnGradientStartColor,
                      AppColors.btnGradientEndColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : null,
            boxShadow: showShadow
                ? [
                    BoxShadow(
                      color: buttonColor.withOpacity(0.8),
                      offset: Offset(0, 2),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ]
                : [],
          ),
          child: Material(
            // <------------------------- Inner Material
            type: MaterialType.transparency,
            elevation: elevation,
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            // shadowColor: Colors.grey[50],
            child: InkWell(
              //<------------------------- InkWell
              splashColor: isDisabled
                  ? AppColors.transparent
                  : showRippleEffect
                      ? splashColor
                      : AppColors.transparent,
              onTap: isLoading
                  ? null
                  : () {
                      if (onPressed != null) {
                        ContextGlobalMethod.hideGlobalKb(context);
                        onPressed!();
                      }
                      // ignore: unnecessary_statements
                    },
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
              child: Container(
                width: btnWidth,
                height: btnHeight ?? 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius ?? 12),
                ),
                alignment: Alignment.center,
                // child: isLoading ? buildLoader() : buildCenterContent(),
                child: AnimatedSwitcher(
                  child: isLoading ? buildLoader() : buildCenterContent(),
                  duration: Duration(milliseconds: 500),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildCenterContent() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leftIcon != null)
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: isDisabled ? 0.55 : 1,
            child: Padding(
              padding: EdgeInsets.only(right: leftIconPadding),
              child: leftIcon,
            ),
          ),
        AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: isDisabled ? 0.55 : 1,
          child: Text(
            btnText,
            overflow: TextOverflow.ellipsis,
            style: textStyle != null
                ? textStyle!.copyWith(
                    color: textColor,
                  )
                : AppThemeData.primaryButtonTextStyle.copyWith(
                    color: textColor,
                  ),
          ),
        ),
        if (rightIcon != null)
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: isDisabled ? 0.55 : 1,
            child: Padding(
              padding: EdgeInsets.only(right: rightIconPadding),
              child: rightIcon,
            ),
          ),
      ],
    );
  }

  SizedBox buildLoader() {
    return SizedBox(
      height: btnHeight ?? 52 / 2,
      width: btnHeight ?? 52 / 2,
      child: CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation<Color>(
          loaderColor,
        ),
      ),
    );
  }
}

// return Container(
//   alignment: Alignment.center,
//   child: Material(
//     borderRadius: BorderRadius.circular(borderRadius),
//     color: buttonColor,
//     child: InkWell(
//       borderRadius: BorderRadius.circular(borderRadius),
//       onTap: onPressed,
//       // overlayColor: AppColor.btnPrimaryColor,
//       child: Container(
//         width: btnWidth,
//         height: btnHeight,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(borderRadius),
//           color: isGradientButton ? null : buttonColor,
//           gradient: isGradientButton
//               ? LinearGradient(
//                   colors: [
//                     AppColors.btnGradientStartColor,
//                     AppColors.btnGradientEndColor,
//                   ],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 )
//               : null,
//           boxShadow: showShadow
//               ? [
//                   BoxShadow(
//                     color: buttonColor.withOpacity(0.8),
//                     offset: Offset(0, 2),
//                     blurRadius: 10,
//                     spreadRadius: 1,
//                   ),
//                 ]
//               : [],
//           border: Border.all(
//             width: borderWidth,
//             color: borderColor,
//           ),
//         ),
//         child: Text(
//           btnText,
//           style: textStyle,
//         ),
//         /*child: TextButton(
//           onPressed: () => {},
//           style: TextButton.styleFrom(
//             backgroundColor: buttonColor,
//             textStyle: textStyle,
//             primary: textColor,
//             alignment: Alignment.center,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[Icon(Icons.add), Text("Add")],
//           ),
//         ),*/
//       ),
//     ),
//   ),
// );
