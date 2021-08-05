import 'dart:io';

import 'package:basic_template/common/app_widget/app_shimmer_effect.dart';
import 'package:basic_template/common/themes/app_assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// common app image widget which automatic identify & display image as network or asset or svg
// ignore: must_be_immutable
class AppImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final String? blurHashCode;
  final BoxFit fit;
  bool isRounded = false;

  AppImageWidget({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.blurHashCode,
    this.fit = BoxFit.cover,
    this.isRounded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(isRounded ? 100 : 0),
      child: getImageWidgetAccordingToType(),
    );
  }

  Widget getImageWidgetAccordingToType() {
    if (imageUrl.contains("assets")) {
      if (imageUrl.contains(".svg")) {
        return SvgPicture.asset(
          imageUrl,
          width: width,
          height: isRounded ? width : height,
          fit: fit,
        );
      } else {
        return Image.asset(
          imageUrl,
          fit: fit,
          height: isRounded ? width : height,
          width: width,
          errorBuilder: (context, url, error) => buildErrorWidget(),
        );
      }
    } else {
      if (imageUrl.contains(".svg")) {
        return SvgPicture.network(
          imageUrl,
          width: width,
          height: isRounded ? width : height,
          fit: fit,
        );
      } else if (imageUrl.contains("http") || imageUrl.contains("www")) {
        return CachedNetworkImage(
          imageUrl: imageUrl,
          memCacheHeight: 500,
          placeholder: (context, url) => Center(
            child: AppShimmer(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset(
                  AppAssets.logo,
                  height: height != null ? height! * 0.6 : null,
                  width: isRounded
                      ? width != null
                          ? width! * 0.6
                          : null
                      : height != null
                          ? height! * 0.6
                          : null,
                ),
              ),
            ),
          ),
          // placeholder: (context, url) {
          //   return BlurHash(
          //     hash: (blurHashCode != null && blurHashCode != "")
          //         ? blurHashCode!
          //         : AppStrings.appImageHashCode,
          //     image: imageUrl,
          //   );
          // },
          errorWidget: (context, url, error) => buildErrorWidget(),
          height: isRounded ? width : height,
          width: width,
          fit: fit,
        );
      } else {
        return Image.file(
          File(imageUrl),
          height: isRounded ? width : height,
          width: width,
          fit: fit,
          errorBuilder: (context, url, error) => buildErrorWidget(),
        );
      }
    }
  }

  Widget buildErrorWidget() {
    return Image.asset(
      AppAssets.placeholder,
      fit: fit,
      height: isRounded ? width : height,
      width: width,
    );
  }
}
