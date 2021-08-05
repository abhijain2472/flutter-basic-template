import 'package:basic_template/app_import.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// common shimmer effect widget for display while loading data
class AppShimmer extends StatelessWidget {
  final Widget child;

  const AppShimmer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      period: Duration(seconds: 2),
      enabled: true,
      child: child,
    );
  }
}
