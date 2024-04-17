import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasbix/feature/domain/repositories/repositories.dart';

class CountRepository implements CountRepositoryInterface {
  CountRepository({required this.preferences});
  final SharedPreferences preferences;

  @override
  int getCount() {
    return preferences.getInt('count') ?? 0;
  }

  @override
  void setCount(int count) {
    preferences.setInt('count', count);
  }
}
