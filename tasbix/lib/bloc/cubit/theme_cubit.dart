import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(Brightness.light));

  void toggleTheme(Brightness brightness) {
    emit(ThemeState(brightness));
  }
}
