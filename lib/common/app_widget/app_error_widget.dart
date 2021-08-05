import 'package:basic_template/common/app_widget/app_alert_dialog.dart';
import 'package:basic_template/common/themes/app_strings.dart';
import 'package:basic_template/common/themes/app_theme_data.dart';
import 'package:basic_template/common/themes/app_ui_helper.dart';
import 'package:basic_template/app_import.dart';
import 'package:basic_template/services/network/enum/store_enum.dart';
import 'package:basic_template/widgets/animated_widgets/app_scale_animation_widget.dart';
import 'package:basic_template/widgets/asset_icon_widget.dart';
import 'package:flutter/material.dart';

/// common Error widget displayed on all screens
class AppErrorWidget extends StatefulWidget {
  final String errorMessage;
  final UIState uiState;
  final Function? onFinish;
  final Widget? child;
  final bool showRetryButton;
  final Function? onTapRetry;
  final EdgeInsets? margin;
  final String? icon;
  final String? subText;
  final String? text;
  final double iconSize;
  final bool isInternetError;

  const AppErrorWidget({
    Key? key,
    required this.errorMessage,
    required this.uiState,
    this.onFinish,
    this.isInternetError = false,
    this.child,
    this.subText,
    this.icon,
    this.text,
    this.iconSize = 104,
    this.onTapRetry,
    this.showRetryButton = false,
    this.margin,
  }) : super(key: key);

  @override
  _AppErrorWidgetState createState() => _AppErrorWidgetState();
}

class _AppErrorWidgetState extends State<AppErrorWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(Duration.zero).then((value) async {
        if (widget.errorMessage != "") {
          /// write error show code here flushbar / snackbar or dialogue
          showAppAlertDialog(
            context: context,
            title: 'Error',
            content: widget.errorMessage,
            defaultActionText: 'Ok',
          );
          // Utility.showFlushBar(context: context, msg: widget.errorMessage)
          //     .then((value) {
          //   if (widget.onFinish != null) {
          //     widget.onFinish!();
          //   }
          // });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.showRetryButton
        ? buildRetryButton()
        : widget.child ??
            ListView(
              // we need to use list view for refresh indicator other wise refresh indicator will not trigger

              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [],
            );
  }

  Widget buildRetryButton() {
    return AppScaleAnimation(
      expand: true,
      child: ScrollConfiguration(
        behavior: NoGlowBehaviour(),
        child: Container(
          alignment: Alignment.center,
          // color: AppColors.whiteColor,
          margin: widget.margin,
          // we need to use list view for refresh indicator other wise refresh indicator will not trigger
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              // buildIconTextWidget(
              //   text: widget.isInternetError
              //       ? AppStrings.noInternetText
              //       : widget.text,
              //   subText: widget.isInternetError
              //       ? AppStrings.noInternetSubText
              //       : widget.subText,
              //   icon: widget.isInternetError
              //       ? Icons.wifi_off_rounded
              //       : widget.icon,
              // ),
              // RetryButtonWidget(
              //   onTapRetry: widget.onTapRetry,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIconTextWidget({
    String? icon,
    String? text,
    String? subText,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null && icon.trim().isNotEmpty)
          AssetIconWidget(
            icon: icon,
            width: widget.iconSize,
            height: widget.iconSize,
          ),
        if (text != null && text.trim().isNotEmpty)
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              top: 30,
              bottom: 16,
            ),
            child: Text(
              text,
              style: AppThemeData.emptyStateTextStyle,
            ),
          ),
        if (subText != null && subText.trim().isNotEmpty)
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              bottom: 24,
            ),
            child: Text(
              subText,
              style: AppThemeData.emptyStateSubTextStyle,
            ),
          ),
      ],
    );
  }
}
