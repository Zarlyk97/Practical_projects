import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbix/feature/tasbix/domain/repositories/repositories.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    required SettingRepositoryInterface settingRepository,
  })  : _settingRepository = settingRepository,
        super(ThemeState(settingRepository.isDarkThemeSelected()
            ? Brightness.dark
            : Brightness.light));
  final SettingRepositoryInterface _settingRepository;
  Future<void> toggleTheme(Brightness brightness) async {
    emit(ThemeState(brightness));
    await _settingRepository
        .setDarkThemeSelected(brightness == Brightness.dark);
  }
}
