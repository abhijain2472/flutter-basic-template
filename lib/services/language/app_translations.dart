import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../hive_keys.dart';

class AppTranslations {
  Locale? locale;
  static Map<dynamic, dynamic>? _localisedValues;
  static Box? box;

  AppTranslations(Locale locale) {
    this.locale = locale;
  }

  static AppTranslations? of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }

  static Future<AppTranslations> load(Locale locale) async {
    AppTranslations appTranslations = AppTranslations(locale);
    if (!Hive.isBoxOpen(HiveKeys.lan_box_name)) {
      box = await Hive.openBox(HiveKeys.lan_box_name);
    }

    /*String jsonContent = await rootBundle
        .loadString("assets/locale/localization_${locale.languageCode}.json");
    _localisedValues = json.decode(jsonContent);*/

    return appTranslations;
  }

  get currentLanguage => locale!.languageCode;

  String text(String key) {
    return box!.get(key, defaultValue: "$key not found");
//    return _localisedValues[key] ?? "$key not found";
  }
}
