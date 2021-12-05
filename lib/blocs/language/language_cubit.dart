import 'package:banbeis/configs/config.dart';
import 'package:banbeis/utils/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(AppLanguage.defaultLanguage);

  ///On Change Language
  void onUpdate(Locale locale) {
    emit(locale);

    ///Preference save
    UtilPreferences.setString(
      Preferences.language,
      locale.languageCode,
    );
  }
}
