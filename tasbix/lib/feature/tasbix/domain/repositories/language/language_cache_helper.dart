import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  Future<void> cacheLanguageCode(String languagecode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('LOCAL_LANGUAGE', languagecode);
  }

  Future<String?> getCachedLanguageCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedlanguageCode = sharedPreferences.getString('LOCAL_LANGUAGE');
    if (cachedlanguageCode != null) {
      return cachedlanguageCode;
    } else {
      return 'en';
    }
  }
}
