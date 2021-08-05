import 'package:flutter/material.dart';

import 'app_colors.dart';

Widget horizontalSpaceTiny = SizedBox(width: 5);
Widget horizontalSpace1 = SizedBox(width: 1);
Widget horizontalSpace2 = SizedBox(width: 2);
Widget horizontalSpace4 = SizedBox(width: 4);
Widget horizontalSpace7 = SizedBox(width: 7);
Widget horizontalSpace8 = SizedBox(width: 8);
Widget horizontalSpaceSmall = SizedBox(width: 10);
Widget horizontalSpace12 = SizedBox(width: 12);
Widget horizontalSpace15 = SizedBox(width: 15);
Widget horizontalSpace16 = SizedBox(width: 16);
Widget horizontalSpace20 = SizedBox(width: 20);
Widget horizontalSpace17 = SizedBox(width: 17);
Widget horizontalSpaceMedium = SizedBox(width: 25);

Widget verticalSpace2 = SizedBox(height: 2);
Widget verticalSpace1 = SizedBox(height: 1);
Widget verticalSpace3 = SizedBox(height: 3);
Widget verticalSpace4 = SizedBox(height: 4);
Widget verticalSpaceTiny = SizedBox(height: 5);
Widget verticalSpace8 = SizedBox(height: 8);
Widget verticalSpace7 = SizedBox(height: 7);
Widget verticalSpaceSmall = SizedBox(height: 10);
Widget verticalSpace20 = SizedBox(height: 20);
Widget verticalSpace30 = SizedBox(height: 30);
Widget verticalSpace15 = SizedBox(height: 15);
Widget verticalSpace14 = SizedBox(height: 14);
Widget verticalSpace12 = SizedBox(height: 12);
Widget verticalSpace11 = SizedBox(height: 11);
Widget verticalSpace24 = SizedBox(height: 24);
Widget verticalSpace22 = SizedBox(height: 22);
Widget verticalSpace23 = SizedBox(height: 23);
Widget verticalSpace16 = SizedBox(height: 16);
Widget verticalSpace18 = SizedBox(height: 18);
Widget verticalSpace38 = SizedBox(height: 38);
Widget verticalSpace32 = SizedBox(height: 32);
Widget verticalSpace36 = SizedBox(height: 36);
Widget verticalSpace26 = SizedBox(height: 26);
Widget verticalSpace28 = SizedBox(height: 28);
Widget verticalSpace40 = SizedBox(height: 40);
Widget verticalSpace60 = SizedBox(height: 60);

Widget verticalSpaceMedium = SizedBox(height: 25);
Widget verticalSpaceLarge = SizedBox(height: 50);
Widget verticalSpaceMassive = SizedBox(height: 120);


SizedBox verticalSpace(double height) => SizedBox(height: height);

SizedBox horizontalSpace(double width) => SizedBox(width: width);

int appTextFieldLimit = 30;

int postPaginationLimit = 10;
int commentPaginationLimit = 10;
int userPaginationLimit = 10;

double bottomSheetTopPadding = 18;
double bottomSheetBottomPadding = 28;
int bottomSheetAnimationDuration = 400;
int onBoardAnimationDuration = 400;

double appHorizontalPadding14 = 14;
double appHorizontalPadding = 18;
double appHorizontalPadding25 = 25;
double appHorizontalPadding30 = 30;
double appHorizontalPadding15 = 15;
double appHorizontalPadding10 = 10;
double appHorizontalPadding20 = 20;
double appHorizontalPadding32 = 32;
double appHorizontalPadding24 = 24;

double appHorizontalPadding12 = 12;

/// horizontal divider
Container dividerWidget({Color color = AppColors.greyColor}) {
  return Container(
    height: 1,
    color: color,
  );
}
class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
