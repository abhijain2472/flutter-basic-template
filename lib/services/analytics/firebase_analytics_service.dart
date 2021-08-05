// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_analytics/observer.dart';
// import 'package:flutter/widgets.dart';
//
// class AnalyticsService {
//
//   static AnalyticsService? _instance;
//
//   static Future<AnalyticsService> getInstance() async {
//     if (_instance == null) {
//       _instance = AnalyticsService();
//     }
//
//     return _instance!;
//   }
//
//    static FirebaseAnalytics analytics = FirebaseAnalytics();
//
//   FirebaseAnalyticsObserver getAnalyticsObserver() =>
//       FirebaseAnalyticsObserver(analytics: analytics);
//
//   Future setUserProperties({
//     required String userId,
//   }) async {
//     await analytics.setUserId(userId);
//   }
//
//   Future setScreenName({
//     required String screenName,
//   }) async {
//     await analytics.setCurrentScreen(
//       screenName: screenName,
//     );
//   }
// }
