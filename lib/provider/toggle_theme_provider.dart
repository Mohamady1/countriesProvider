import 'package:flutter/material.dart';

class ToggleTheme with ChangeNotifier {
  bool dark = false;

  setColors() {
    if (dark) {
      return ThemeData(primaryColor: Colors.black, accentColor: Colors.white);
    } else {
      return ThemeData(primaryColor: Colors.white, accentColor: Colors.black);
    }
  }

  void toggleTheme() {
    dark = !dark;
    notifyListeners();
  }
}
