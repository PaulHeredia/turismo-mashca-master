import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProviders extends ChangeNotifier {
  bool _mode = true;
  int _index = 0;

  bool get mode {
    return _mode;
  }

  set mode(bool value) {
    _mode = value;
    notifyListeners();
  }

  int get index {
    return _index;
  }

  set index(int value) {
    _index = value;
    notifyListeners();
  }

  Future<bool> initPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _mode = prefs.getBool("mode") ?? false;
    return _mode;
  }
}
