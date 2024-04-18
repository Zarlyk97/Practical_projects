import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tasbix/feature/domain/repositories/language/language_cache_helper.dart';
import 'package:tasbix/feature/domain/repositories/repositories.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final LanguageCacheHelper _languageCacheHelper;

  LanguageCubit(this._languageCacheHelper) : super(LanguageInitial());

  Future<void> getsavedLanguageCode() async {
    final cachedLanguageCode =
        await _languageCacheHelper.getCachedLanguageCode();
    emit(ChangeLanguageState(locale: Locale(cachedLanguageCode!)));
  }

  Future<void> changeLanguage(String languageCode) async {
    emit(ChangeLanguageLoading());
    await _languageCacheHelper.cacheLanguageCode(languageCode);
    emit(ChangeLanguageState(locale: Locale(languageCode)));
  }

  String getCurrentLanguageCode() {
    final currentState = state;
    if (currentState is ChangeLanguageState) {
      return currentState.locale.languageCode;
    }
    return 'en';
  }
}
