abstract interface class SettingRepositoryInterface {
  bool isDarkThemeSelected();
  Future<void> setDarkThemeSelected(bool selected);
}
