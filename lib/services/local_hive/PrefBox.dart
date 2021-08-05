import 'package:basic_template/common/model/user_payload.dart';
import 'package:hive/hive.dart';

import '../hive_keys.dart';

/// prefbox class used to store & get data locally in device
class PrefBox {
  static PrefBox? _instance;
  static Box? box;

  final String _keyIsLogin = "is_login";
  final String _keyUserId = "user_id";
  final String _keyUserToken = "user_token";
  final String _keyUserPayload = "user_payload";
  final String _keyLanguageCode = "languageCode";
  final String _keyNotificationCount = "notification_count";
  final String _keyBasicSettings = "basic_settings";
  final String _keyLastUsedLibraryTab = "library_tab";

  static const KEY_DEVICE_PIXEL_RATIO = "device_pixel_ratio";

  static Future<PrefBox> getInstance() async {
    if (_instance == null) {
      _instance = PrefBox();
    }

    if (!Hive.isBoxOpen(HiveKeys.pref_box_name)) {
      box = await Hive.openBox(HiveKeys.pref_box_name);
    } else {
      box = Hive.box(HiveKeys.pref_box_name);
    }

    return _instance!;
  }

  bool get isLogin {
    return box!.get(_keyIsLogin) ?? false;
  }

  set isLogin(bool flag) {
    box!.put(_keyIsLogin, flag);
  }

  UserPayload get userPayload {
    return box!.get(_keyUserPayload, defaultValue: UserPayload());
  }

  set userPayload(UserPayload? userPayload) {
    box!.put(_keyUserPayload, userPayload);
  }

  String get userId {
    return box!.get(_keyUserId, defaultValue: "");
  }

  set userId(String? flag) {
    box!.put(_keyUserId, flag);
  }

  set newNotificationCount(int count) {
    box!.put(_keyNotificationCount, count);
  }

  int get newNotificationCount {
    return box!.get(_keyNotificationCount, defaultValue: 0);
  }

  String get languageCode {
    return box!.get(_keyLanguageCode) ?? 'EN';
  }

  set languageCode(String languageCode) {
    box!.put(_keyLanguageCode, languageCode);
  }

  set devicePixelRatio(num devicePixelRatio) {
    box!.put(KEY_DEVICE_PIXEL_RATIO, devicePixelRatio);
  }

  num get devicePixelRatio {
    return box!.get(KEY_DEVICE_PIXEL_RATIO) ?? 0.0;
  }

  set fcmUserToken(String devicePixelRatio) {
    box!.put(_keyUserToken, devicePixelRatio);
  }

  String get fcmUserToken {
    return box!.get(_keyUserToken) ?? "";
  }


}
