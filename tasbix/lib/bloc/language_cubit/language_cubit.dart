import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tasbix/feature/tasbix/domain/repositories/language/language_cache_helper.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
  Future<void> getsavedLanguageCode() async {
    final String cashedLanguageCode =
        LanguageCacheHelper().getCachedLanguageCode().toString();
    emit(
      ChangeLanguageState(locale: Locale(cashedLanguageCode)),
    );
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(ChangeLanguageState(locale: Locale(languageCode)));
  }

  String getCurrentLanguageCode() {
    final currentState = state;
    if (currentState is ChangeLanguageState) {
      return currentState.locale.languageCode;
    }
    return 'en'; // баштапкы тил кодун коюңуз
  }
}
