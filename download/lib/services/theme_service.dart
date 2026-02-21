import 'package:download/ui/providers/theme_color_provider.dart';
import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  ThemeColor _currentThemeColor = ThemeColor.blue;

  ThemeColor get currentThemeColor => _currentThemeColor;

  void setNewTheme(ThemeColor newThemeColor) {
    if (_currentThemeColor != newThemeColor) {
      _currentThemeColor = newThemeColor;
      notifyListeners();
    }
  }
}
