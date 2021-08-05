import 'dart:async';

import 'package:flutter/material.dart';

import 'app_translations.dart';

class AppTranslationsDelegate extends LocalizationsDelegate<AppTranslations> {
  late Locale? newLocale;

  AppTranslationsDelegate({this.newLocale});

  @override
  bool isSupported(Locale locale) {
    return true;
//    return application.supportedLanguagesCodes.contains(locale.languageCode);
  }

  @override
  Future<AppTranslations> load(Locale locale) {
    return AppTranslations.load(newLocale ?? locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppTranslations> old) {
    return true;
  }
}
