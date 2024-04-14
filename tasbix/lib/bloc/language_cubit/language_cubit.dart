import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasbix/feature/tasbix/domain/repositories/language/language_cache_helper.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final SharedPreferences preferences;
  LanguageCubit(this.preferences) : super(LanguageInitial());
  Future<void> getsavedLanguageCode() async {
    final String cashedLanguageCode =
        LanguageCacheHelper(preferences: preferences)
            .getCachedLanguageCode()
            .toString();
    emit(
      ChangeLanguageState(locale: Locale(cashedLanguageCode)),
    );
  }

  Future<void> changeLanguage(String languageCode) async {
    emit(ChangeLanguageLoading());
    await LanguageCacheHelper(preferences: preferences)
        .cacheLanguageCode(languageCode);
    emit(ChangeLanguageState(locale: Locale(languageCode)));
  }

  String getCurrentLanguageCode() {
    final currentState = state;
    if (currentState is ChangeLanguageState) {
      return currentState.locale.languageCode;
    }
    return 'ru'; // баштапкы тил кодун коюңуз
  }
}
