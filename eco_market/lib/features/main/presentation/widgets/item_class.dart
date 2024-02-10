import 'package:shared_preferences/shared_preferences.dart';

class Items {
  int counter = 0;
  static const counterkey = 'counter';

  Future incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    counter < 50 ? counter = (prefs.getInt('counterKey') ?? 0) + 1 : null;
    prefs.setInt('counterKey', counter);
  }

  Future decrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    counter > 0 ? counter = (prefs.getInt('counterKey') ?? 0) - 1 : null;
    prefs.setInt('counterKey', counter);
    return null;
  }

  Future getCounter() async {
    final prefs = await SharedPreferences.getInstance();
    counter = (prefs.getInt('counterKey') ?? 0);
  }
}
