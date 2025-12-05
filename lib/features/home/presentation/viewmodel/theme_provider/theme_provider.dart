import 'package:flutter/material.dart';
import '../../../../../core/helper/shared_check_helper.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeMode themeApp;

  ThemeProvider(bool isDark) {
    themeApp = isDark ? ThemeMode.dark : ThemeMode.light;
  }
  Future<void> changeTheme(ThemeMode newTheme) async {
    if (newTheme == themeApp) {
      return;
    } else {
      themeApp = newTheme;
    }
    await SharedCheckHelper.setTheme(isDark());
    notifyListeners();
  }
  bool isDark() {
    return themeApp == ThemeMode.dark;
  }
}
