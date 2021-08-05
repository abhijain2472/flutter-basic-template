
import 'package:basic_template/common/themes/app_colors.dart';
import 'package:basic_template/common/themes/app_strings.dart';
import 'package:basic_template/common/themes/app_theme_data.dart';
import 'package:basic_template/common/themes/app_ui_helper.dart';
import 'package:basic_template/widgets/asset_icon_widget.dart';
import 'package:flutter/material.dart';

import 'animated_widgets/app_scale_animation_widget.dart';
import 'app_primary_button.dart';

/// common no data found widget with icon & text
class NoDataFoundWidget extends StatelessWidget {
  final String text;
  final String? subText;
  final Object? iconData;
  final String? btnText;
  final Function? onBtnTap;
  final EdgeInsets? margin;
  final double iconSize;
  final double btnTopPadding;

  const NoDataFoundWidget({
    Key? key,
    required this.text,
    this.btnText,
    this.subText,
    this.onBtnTap,
    this.iconSize = 104,
    this.iconData,
    this.btnTopPadding = 22,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaleAnimation(
      expand: true,
      child: Container(
        margin: margin,
        alignment: Alignment.center,
        child: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: ListView(
            // we need to use list view for refresh indicator other wise refresh indicator will not trigger
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              if (iconData != null)
                Center(
                  child: iconData is IconData
                      ? Icon(
                          (iconData as IconData),
                          color: AppColors.greyColor,
                          size: iconSize,
                        )
                      : AssetIconWidget(
                          icon: iconData.toString(),
                          height: iconSize,
                          width: iconSize,
                        ),
                ),
              if (iconData != null) verticalSpace(30),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppThemeData.emptyStateTextStyle,
                ),
              ),
              subText != null && subText!.trim().isNotEmpty
                  ? Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                      child: Text(
                        subText!,
                        textAlign: TextAlign.center,
                        style: AppThemeData.emptyStateSubTextStyle,
                      ),
                    )
                  : verticalSpace(24),
              if (btnText != null && btnText!.trim().isNotEmpty)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppPrimaryButtonWidget(
                      margin: EdgeInsets.only(top: btnTopPadding),
                      btnHeight: 32,
                      borderRadius: 16,
                      btnWidth: 125,
                      textColor: AppColors.whiteTextColor,
                      buttonColor: AppColors.primary,
                      onPressed: onBtnTap,
                      btnText: btnText!,
                      textStyle: AppThemeData.white14TextStyle.copyWith(
                        fontFamily: AppStrings.font_semi_bold,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
