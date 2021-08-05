import 'package:basic_template/common/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'app_strings.dart';

/// common app theme data class which contain all the data related to theme like text style
class AppThemeData {
  static ThemeData appThemeData() => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,

        ///Page transitions
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          },
        ),

        /// Main colors
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        accentColor: AppColors.accent,

        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: AppColors.primary,
              primary: AppColors.primary,
              background: AppColors.background_color,
            ),

        ///Backgrounds color
        backgroundColor: AppColors.background_color,
        scaffoldBackgroundColor: AppColors.scaffold_color,

        ///Font name
        fontFamily: AppStrings.font_regular,

        ///Text theme
        // textTheme: GoogleFonts.latoTextTheme(),
        ///AppBar common.theme
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(
            color: AppColors.blackTextColor,
          ),
          elevation: 0.0,
          // centerTitle: true,
        ),

        ///Bottom tab bar
        bottomAppBarTheme: BottomAppBarTheme(
          color: AppColors.icon_color,
        ),

        ///Icon common.theme
        iconTheme: IconThemeData(color: AppColors.icon_color),

        primaryTextTheme: TextTheme(),
      );

  static TextStyle normal16 = TextStyle(
    fontSize: 16,
    color: AppColors.blackTextColor,
    fontFamily: AppStrings.font_regular,
  );

  static TextStyle medium16 = TextStyle(
    fontSize: 16,
    color: AppColors.blackTextColor,
    fontFamily: AppStrings.font_medium,
  );

  static TextStyle semiBold16 = TextStyle(
    fontSize: 16,
    color: AppColors.blackTextColor,
    fontFamily: AppStrings.font_semi_bold,
  );

  static TextStyle bold16 = TextStyle(
    fontSize: 16,
    color: AppColors.blackTextColor,
    fontFamily: AppStrings.font_bold,
  );

  static TextStyle extraBold16 = TextStyle(
    fontSize: 16,
    color: AppColors.blackTextColor,
    fontFamily: AppStrings.font_extra_bold,
  );

  static TextStyle primary14TextStyle = TextStyle(
    fontSize: 14.0,
    color: AppColors.primaryTextColor,
    fontFamily: AppStrings.font_regular,
  );

  static TextStyle primary16TextStyle = TextStyle(
    fontSize: 16.0,
    color: AppColors.primaryTextColor,
    fontFamily: AppStrings.font_regular,
  );

  static TextStyle primary18TextStyle = TextStyle(
    fontSize: 18,
    color: AppColors.primaryTextColor,
    fontFamily: AppStrings.font_regular,
  );

  static TextStyle black12TextStyle = TextStyle(
    fontSize: 12,
    color: AppColors.blackTextColor,
    fontFamily: AppStrings.font_regular,
  );
  static TextStyle black14TextStyle = TextStyle(
    fontSize: 14,
    color: AppColors.blackTextColor,
    fontFamily: AppStrings.font_regular,
  );

  static TextStyle black16TextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.blackTextColor,
    fontFamily: AppStrings.font_regular,
  );

  static TextStyle black18TextStyle = TextStyle(
    fontSize: 18,
    color: AppColors.blackTextColor,
    fontFamily: AppStrings.font_regular,
  );

  static TextStyle white14TextStyle = TextStyle(
    fontSize: 14,
    color: AppColors.whiteTextColor,
    fontFamily: AppStrings.font_regular,
  );
  static TextStyle white12TextStyle = TextStyle(
    fontSize: 12,
    color: AppColors.whiteTextColor,
    fontFamily: AppStrings.font_regular,
  );

  static TextStyle white16TextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.whiteTextColor,
    fontFamily: AppStrings.font_regular,
  );

  static TextStyle white18TextStyle = TextStyle(
    fontSize: 18,
    color: AppColors.whiteTextColor,
    fontFamily: AppStrings.font_regular,
  );

  static TextStyle grey12TextStyle = TextStyle(
    fontSize: 12,
    color: AppColors.greyTextColor,
    fontFamily: AppStrings.font_regular,
  );

  static TextStyle grey14TextStyle = TextStyle(
    fontSize: 14,
    color: AppColors.greyTextColor,
    fontFamily: AppStrings.font_regular,
  );

  static TextStyle grey16TextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.greyTextColor,
    fontFamily: AppStrings.font_regular,
  );

  static TextStyle grey18TextStyle = TextStyle(
    fontSize: 18,
    color: AppColors.greyTextColor,
    fontFamily: AppStrings.font_regular,
  );

  static TextStyle primaryButtonTextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.whiteTextColor,
    fontFamily: AppStrings.font_semi_bold,
  );



  static TextStyle appBarTitleTextStyle = TextStyle(
    fontSize: 18,
    color: AppColors.blackTextColor,
    fontFamily: AppStrings.font_semi_bold,
  );
  

  static TextStyle dialogueBtnTextStyle = TextStyle(
    fontSize: 14,
    fontFamily: AppStrings.font_semi_bold,
    color: AppColors.primaryTextColor,
  );

  static TextStyle dialogueTitleTextStyle = TextStyle(
    fontSize: 20,
    fontFamily: AppStrings.font_semi_bold,
    color: AppColors.greyTextColor,
  );

  static TextStyle dialogueContentTextStyle = TextStyle(
    fontSize: 14,
    fontFamily: AppStrings.font_regular,
    color: AppColors.greyTextColor,
  );

  static TextStyle emptyStateTextStyle = TextStyle(
    fontSize: 22,
    fontFamily: AppStrings.font_semi_bold,
    color: AppColors.greyTextColor,
  );

  static TextStyle emptyStateSubTextStyle = TextStyle(
    fontSize: 16,
    fontFamily: AppStrings.font_regular,
    color: AppColors.greyTextColor,
  );
}
