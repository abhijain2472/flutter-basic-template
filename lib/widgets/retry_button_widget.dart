import 'package:basic_template/app_import.dart';
import 'package:flutter/material.dart';

import 'app_primary_button.dart';

class RetryButtonWidget extends StatelessWidget {
  final Function? onTapRetry;
  const RetryButtonWidget({
    Key? key,
    this.onTapRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppPrimaryButtonWidget(
          btnHeight: 32,
          splashColor: AppColors.primary,
          borderColor: AppColors.primary,
          borderWidth: 1,
          borderRadius: 16,
          leftIcon: Icon(
            Icons.refresh_sharp,
            color: AppColors.primary,
            size: 20,
          ),
          leftIconPadding: 6,
          btnWidth: 100,
          textColor: AppColors.primary,
          buttonColor: AppColors.whiteColor,
          onPressed: onTapRetry,
          btnText: 'Retry',
          textStyle: AppThemeData.primary14TextStyle
              .copyWith(fontFamily: AppStrings.font_semi_bold, fontSize: 15),
        ),
      ],
    );
  }
}
