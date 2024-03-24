import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasbix/feature/tasbix/domain/repositories/setting/setting.dart';

class SettingRepository implements SettingRepositoryInterface {
  SettingRepository({required this.preferences});

  final SharedPreferences preferences;
  static const _isDarkThemeSelected = 'isDarkThemeSelectedKey';

  @override
  bool isDarkThemeSelected() {
    final selected = preferences.getBool(_isDarkThemeSelected);
    return selected ?? false;
  }

  @override
  Future<void> setDarkThemeSelected(bool selected) async {
    await preferences.setBool('isDarkThemeSelectedKey', selected);
  }
}
