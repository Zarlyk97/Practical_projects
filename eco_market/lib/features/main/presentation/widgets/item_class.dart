import 'package:shared_preferences/shared_preferences.dart';

class Items {
  int counter = 0;

  void incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    counter < 50 ? counter = (prefs.getInt('counter') ?? 0) + 1 : null;
    prefs.setInt('counter', counter);
  }

  void decrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    counter > 0 ? counter = (prefs.getInt('counter') ?? 0) - 1 : null;
    prefs.setInt('counter', counter);
  }

  void getCounter() async {
    final prefs = await SharedPreferences.getInstance();
    counter = (prefs.getInt('counter') ?? 0);
  }
}
