
import 'package:basic_template/feature/landing_screen/landing_screen.dart';

import '../app_import.dart';
import 'asset_icon_widget.dart';

/// customized app bar according to design
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? secondaryTitle;
  final bool showBackIcon;
  final Function? onLeadingTap;
  final Widget? leading;
  final List<Widget>? actions;
  final double elevation;
  final Color color;
  final bool centerTitle;
  final TextStyle? titleTextStyle;
  final bool showCloseActionIcon;
  final Function? onCloseActionIconTap;
  final String leadingIcon;
  final Color leadingIconColor;
  final Widget? titleWidget;
  final double? height;

  @override
  final Size preferredSize;

  CustomAppBar({
    Key? key,
    this.title,
    this.secondaryTitle,
    this.showBackIcon = true,
    this.onLeadingTap,
    this.leading,
    this.height,
    this.actions,
    this.elevation = 0.0,
    this.centerTitle = false,
    this.showCloseActionIcon = false,
    this.onCloseActionIconTap,
    this.leadingIcon = AppAssets.nav_back_arrow,
    this.titleTextStyle,
    this.titleWidget,
    this.leadingIconColor = AppColors.blackColor,
    this.color = AppColors.whiteColor,
  })  : preferredSize = Size.fromHeight(
          height != null
              ? height
              : secondaryTitle == null
                  ? kToolbarHeight
                  : kToolbarHeight + 36,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      elevation: elevation,
      centerTitle: centerTitle,
      titleSpacing: showBackIcon ? 8 : 20,
      automaticallyImplyLeading: false,
      leading: leading != null
          ? leading
          : showBackIcon
              ? AssetIconWidget(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 16,
                  ),
                  icon: leadingIcon,
                  onTap: onLeadingTap != null
                      ? onLeadingTap
                      : () {
                          appRouter.pop();
                        },
                  color: leadingIconColor,
                  height: 20,
                  width: 20,
                )
              : null,
      actions: showCloseActionIcon
          ? [
              AssetIconWidget(
                margin: EdgeInsets.only(right: 20),
                icon: AppAssets.cross,
                color: AppColors.blackTextColor,
                height: 20,
                width: 20,
                onTap: onCloseActionIconTap != null
                    ? onCloseActionIconTap
                    : () {
                        appRouter.pop();
                      },
              )
            ]
          : actions,
      title: titleWidget == null
          ? title != null
              ? Text(
                  title!,
                  style: titleTextStyle ?? AppThemeData.appBarTitleTextStyle,
                )
              : null
          : titleWidget,
      bottom: secondaryTitle != null
          ? AppbarBottomWidget(
              color: color,
              label: secondaryTitle!,
            )
          : null,
      // bottom: ,
    );
  }
}

class AppbarBottomWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? label;
  final Color color;
  @override
  final Size preferredSize;

  AppbarBottomWidget({
    Key? key,
    this.label,
    this.color = AppColors.whiteColor,
  })  : preferredSize = Size.fromHeight(36),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: appHorizontalPadding),
      decoration: BoxDecoration(
        color: color,
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        label!,
        style: AppThemeData.black18TextStyle.copyWith(
          fontSize: 31,
          fontFamily: AppStrings.font_bold,
          letterSpacing: -0.2,
        ),
      ),
    );
  }
}
