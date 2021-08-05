//
// import 'package:basic_template/common/themes/app_strings.dart';
// import 'package:basic_template/common/themes/utility.dart';
// import 'package:basic_template/feature/landing_screen/landing_screen.dart';
// import 'package:basic_template/services/local_hive/PrefBox.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:package_info/package_info.dart';
//
// class DynamicLinkService {
//   static DynamicLinkService? _instance;
//
//   DynamicLinkService._() {
//     print("DynamicLinkService()");
//   }
//
//   /// get instance of api provider
//   static Future<DynamicLinkService> getInstance() async {
//     if (_instance == null) {
//       _instance = DynamicLinkService._();
//     }
//     return _instance!;
//   }
//
//   Future<void> handleDynamicLinks() async {
//     // Get the initial dynamic link if the app is opened with a dynamic link
//     final PendingDynamicLinkData? data =
//         await FirebaseDynamicLinks.instance.getInitialLink();
//
//     // handle link that has been retrieved
//     if (data != null && GetIt.I.get<PrefBox>().isLogin) {
//       _handleDeepLink(data);
//     }
//
//     // Register a link callback to fire if the app is opened up from the background
//     // using a dynamic link.
//     FirebaseDynamicLinks.instance.onLink(
//         onSuccess: (PendingDynamicLinkData? dynamicLink) async {
//       // handle link that has been retrieved
//       if (dynamicLink != null && GetIt.I.get<PrefBox>().isLogin) {
//         _handleDeepLink(dynamicLink);
//       }
//     }, onError: (OnLinkErrorException e) async {
//       Utility.showAppToast(AppStrings.commonErrorMsg);
//       print('Link Failed: ${e.message}');
//     });
//   }
//
//   void _handleDeepLink(PendingDynamicLinkData data) {
//     final Uri deepLink = data.link;
//     Utility.log("DYNAMIC LINK DATA : ${deepLink.path}");
//     appRouter.pushNamed(deepLink.path);
//     // appRouter.push(PostDetailsRoute(postId: deepLink.pathSegments.last));
//   }
//
//   // generate dynamic link for share elements
//   Future<String?> generateDynamicLink({
//     required String shareUrlPath,
//     required String shareId,
//     String? imageUrl,
//     String? userName,
//   }) async {
//     Utility.log("THIS IS SHARE ID : $shareId");
//     // var response;
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//
//     final DynamicLinkParameters parameters = DynamicLinkParameters(
//       uriPrefix: AppStrings.domainUriPrefix,
//       link: Uri.parse(
//         FlavorConfig.instance.backOfficeUrl + shareUrlPath + shareId,
//       ),
//       androidParameters: AndroidParameters(
//         packageName: packageInfo.packageName,
//
//         // minimumVersion: 125,
//       ),
//
//       iosParameters: IosParameters(
//         bundleId: packageInfo.packageName,
//
//         // minimumVersion: '1.0.1',
//         appStoreId: AppStrings.iosAppId,
//       ),
//
//       socialMetaTagParameters: SocialMetaTagParameters(
//         title: userName != null && userName.trim().isNotEmpty
//             ? '$userName on App name'
//             : 'App name',
//         description: 'Collaboration & Communication',
//         imageUrl: imageUrl != null
//             ? Uri.parse(imageUrl)
//             : Uri.parse(AppStrings.logoUrl),
//
//         // imageUrl: Uri.parse(AppStrings.logoUrl),
//       ),
//     );
//     // final Uri dynamicUrl = await parameters.buildUrl();
//     // final ShortDynamicLink shortenedLink =
//     //     await DynamicLinkParameters.shortenUrl(
//     //   Uri.parse(
//     //     dynamicUrl.toString(),
//     //   ),
//     // );
//     //
//     // final Uri shortUrl = shortenedLink.shortUrl;
//     // return shortUrl.toString();
//     final ShortDynamicLink shortDynamicLink = await parameters.buildShortLink();
//     final Uri shortUrl = shortDynamicLink.shortUrl;
//     return shortUrl.toString();
//   }
// }
