import 'package:banbeis/configs/config.dart';
import 'package:banbeis/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class AppLocaleDelegate extends LocalizationsDelegate<Translate> {
  const AppLocaleDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLanguage.supportLanguage.contains(locale);
  }

  @override
  Future<Translate> load(Locale locale) async {
    switch (locale.languageCode) {
      case "en":
        timeago.setLocaleMessages('en', timeago.EnMessages());
        break;
      case "bn":
        timeago.setLocaleMessages('bn', timeago.EnMessages());
        break;

      default:
        timeago.setLocaleMessages('en', timeago.EnMessages());
    }

    Translate localizations = Translate(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AppLocaleDelegate old) => false;
}
