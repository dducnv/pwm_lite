import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/main.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _mode;
  ThemeMode get mode => _mode;
  ThemeProvider()
      : _mode = ThemeMode.values.firstWhere((e) => e.name == currentThemeMode);

  void toggleMode() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setMode(ThemeMode mode) {
    _mode = mode;

    SecureStorage.instance.save(
        SecureStorageKeys.themMode.toString(),
        Provider.of<ThemeProvider>(
                GlobalKeys.appRootNavigatorKey.currentContext!,
                listen: false)
            .mode
            .name);
    notifyListeners();
  }
}
