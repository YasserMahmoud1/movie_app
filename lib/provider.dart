import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:n/cache_helper.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  void changeMode({bool? fromShared, required bool fromMain}) {
    if (fromShared != null) {
      isDark = fromShared;
      CacheHelper.putData(isDark: isDark);
    } else if (!fromMain) {
      isDark = !isDark;
      CacheHelper.putData(isDark: isDark);
      notifyListeners();
    }
  }
}
