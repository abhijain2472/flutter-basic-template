// import 'dart:io';
// import 'dart:typed_data';
// import 'package:basic_template/services/local_hive/PrefBox.dart';
// import 'package:get_it/get_it.dart';
//
// import 'model/notification.dart';
//
// const notificationChannel = "Notification channel";
// const notificationChannelId = "Channel_id_1";
// const notificationChannelDescription = "Notification channel description";
//
// class PushNotificationsManager {
//   PushNotificationsManager._();
//
//   late factory PushNotificationsManager
//
//   (
//
//   )
//
//   =>
//
//   instance
//
//   ;
//
//   static final PushNotificationsManager instance = PushNotificationsManager._();
//   int notificationId = 1;
//
//   // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging;
//   bool _initialized = false;
//   bool _hasLaunched = false;
//   NotificationStore? notificationStore;
//
//   late String _payLoad;
//
//   static FlutterLocalNotificationsPlugin _localNotifications =
//   FlutterLocalNotificationsPlugin();
//   String _fcmToken = "test";
//
//   void attachNotificationStore(NotificationStore store) {
//     this.notificationStore = store;
//     this
//         .notificationStore!
//         .setNotificationCount(GetIt.I
//         .get<PrefBox>()
//         .newNotificationCount);
//   }
//
//   Future<void> manageNotificationDotAndBadge() async {
//     // for notification dot
//     if (notificationStore != null) {
//       Utility.log("DOT METHOD CALLED");
//       //for notification dot on appbar notification action icon
//       this.notificationStore?.increaseNotificationCount();
//
//       // for showing new notification badge on app icon..
//       if (await FlutterAppBadger.isAppBadgeSupported() &&
//           this.notificationStore!.showNotificationBadge) {
//         Utility.log("BADGE SHOWED");
//         FlutterAppBadger.updateBadgeCount(
//             this.notificationStore!.getNewNotificationCount);
//       }
//     }
//   }
//
//   Future<void> init() async {
//     if (!_initialized) {
//       _createNotificationChannel();
//       if (Platform.isIOS) {
//         var hasPermission = await _requestIOSPermissions();
//         if (hasPermission) {
//           await _fcmInitialization();
//           _initialized = true;
//         } else {
//           print("You can provide permission by going into Settings later.");
//         }
//       } else {
//         await _fcmInitialization();
//         _initialized = true;
//       }
//       // For iOS request permission first.
//       NotificationAppLaunchDetails _appLaunchDetails =
//       (await _localNotifications.getNotificationAppLaunchDetails())!;
//
//       var initializationSettings = _getPlatformSettings();
//       // await _localNotifications.initialize(initializationSettings,onSelectNotification: (result){
//       //   return "";
//       // });
//       await _localNotifications.initialize(initializationSettings,
//           onSelectNotification: _handleNotificationTap
//       );
//
//       _hasLaunched = _appLaunchDetails.didNotificationLaunchApp;
//       if (_hasLaunched) {
//         if (_appLaunchDetails.payload != null) {
//           _payLoad = _appLaunchDetails.payload!;
//         }
//       }
//     }
//   }
//
//   String get fcmToken => _fcmToken;
//
//   Future<dynamic> _handleNotificationTap(String? payload) async {
//     if (payload != null) {
//       // add(NotificationEvent(payload));
//     }
//   }
//
//   _getPlatformSettings() {
//     var initializationSettingsAndroid =
//     AndroidInitializationSettings('mipmap/ic_launcher');
//     var initializationSettingsIOS = IOSInitializationSettings(
//         requestAlertPermission: true,
//         requestBadgePermission: true,
//         requestSoundPermission: true,
//         defaultPresentSound: true,
//         defaultPresentBadge: true);
//     return InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//   }
//
//   void _createNotificationChannel() async {
//     var androidNotificationChannel = AndroidNotificationChannel(
//       notificationChannelId,
//       notificationChannel,
//       notificationChannelDescription,
//     );
//     await _localNotifications
//         .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(androidNotificationChannel);
//   }
//
//   Future _fcmInitialization() async {
//     try {
//       _fcmToken = (await FirebaseMessaging.instance.getToken())!;
//       print("TOKEN DATA IS THIS : $_fcmToken");
//       FirebaseMessaging.instance.onTokenRefresh.listen((event) {
//         //API call can be done here to update token in back-end
//         _fcmToken = event;
//       });
//       FirebaseMessaging.onMessage.listen((event) {
//         print("onMessage: ${event.data}");
//         Notification notification =
//         convertToNotification(notificationId++, event.data);
//         showNotification(notification);
//         manageNotificationDotAndBadge();
//       });
//
//       FirebaseMessaging.onMessageOpenedApp.listen((event) {
//         print("onMessage: ${event.data}");
//         Notification notification =
//         convertToNotification(notificationId++, event.data);
//         showNotification(notification);
//         manageNotificationDotAndBadge();
//       });
//       FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//     } catch (e) {
//       print('ERROR IN FB MESSAGING : $e');
//     }
//   }
//
//
//   Future<void> showNotification(Notification payload) async {
//     var vibrationPattern = Int64List(4);
//     vibrationPattern[0] = 0;
//     vibrationPattern[1] = 200;
//     vibrationPattern[2] = 200;
//     vibrationPattern[3] = 200;
//
//     var bigTextStyleInformation = BigTextStyleInformation(
//         payload.notificationBody!,
//         contentTitle: payload.notificationTitle);
//
//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       notificationId.toString(),
//       notificationChannel,
//       notificationChannelDescription,
//       icon: 'mipmap/ic_launcher',
//       color: AppColors.primary,
//       vibrationPattern: vibrationPattern,
//       importance: Importance.max,
//       priority: Priority.max,
//       styleInformation: bigTextStyleInformation,
//       channelShowBadge: true,
//     );
//     var iOSPlatformChannelSpecifics = IOSNotificationDetails(
//       presentAlert: true,
//       presentSound: true,
//       badgeNumber: 5,
//       presentBadge: true,
//     );
//     var platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics,
//         iOS: iOSPlatformChannelSpecifics);
//     await _localNotifications.show(
//         payload.notificationId!,
//         payload.notificationTitle,
//         payload.notificationBody,
//         platformChannelSpecifics,
//         payload: payload.toJson());
//   }
//
//   Notification convertToNotification(int notificationId,
//       Map<String, dynamic> message) {
//     Notification notification;
//     if (Platform.isAndroid) {
//       notification = new Notification((object) =>
//       object
//         ..notificationId = notificationId
//         ..notificationTitle = message['notification']['title']
//         ..notificationBody = message['notification']['body']
//         ..notificationType = message['data']['notification_type']);
//     } else {
//       notification = new Notification((object) =>
//       object
//         ..notificationId = notificationId
//         ..notificationTitle = message['aps']['alert']['title']
//         ..notificationBody = message['aps']['alert']['body']
//         ..notificationType = message['notification_type']);
//       print(notification.toJson());
//     }
//     return notification;
//   }
//
//   Future<bool> _requestIOSPermissions() async {
//     var platformImplementation =
//     _localNotifications.resolvePlatformSpecificImplementation<
//         IOSFlutterLocalNotificationsPlugin>();
//     bool permission = false;
//     if (platformImplementation != null) {
//       permission = (await platformImplementation.requestPermissions(
//         alert: true,
//         badge: true,
//         sound: true,
//       ))!;
//     }
//     return permission;
//   }
// }
//
//
// /// NOTE : we need to define this method outside class, otherwise it generate "null check operator was used on null error" in null safety
// /// Here is the reference of the issue : https://firebase.flutter.dev/docs/messaging/usage/#background-messages
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("onBackgroundMessage: $message");
//   Notification notification =
//   PushNotificationsManager.instance.convertToNotification(
//       PushNotificationsManager.instance.notificationId++, message.data);
//   PushNotificationsManager.instance.showNotification(notification);
//   PushNotificationsManager.instance.manageNotificationDotAndBadge();
//   return Future.value(true);
// }
