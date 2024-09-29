import 'dart:async';
import 'dart:collection';
import 'dart:developer';
import 'dart:io';

import 'package:cyber_safe/ui/route/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/core/enums.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/resource/language/lang.dart';
import 'package:flutter/scheduler.dart';

class RootPR extends ChangeNotifier {
  late ThemeMode _themeMode;
  late AppLanguage _appLanguage;
  late bool _requestUpdateVersionKey = false;
  late bool _isOpenAutoLock = false;
  late int _timeAutoLock = 5;
  ThemeMode get themeMode => _themeMode;
  AppLanguage get appLanguage => _appLanguage;
  bool get isOpenAutoLock => _isOpenAutoLock;
  int get timeAutoLock => _timeAutoLock;
  bool get requestUpdateVersionKey => _requestUpdateVersionKey;

  Timer _rootTimer = Timer(Duration.zero, () {});

  RootPR() {
    _themeMode = ThemeMode.system;
    _appLanguage = AppLanguage.en;
    init();
  }

  void init() {
    SecureStorage.instance
        .read(SecureStorageKeys.themMode.toString())
        .then((value) {
      if (value != null) {
        _themeMode =
            ThemeMode.values.firstWhere((element) => element.name == value);
        notifyListeners();
      } else {
        var brightness =
            SchedulerBinding.instance.platformDispatcher.platformBrightness;
        if (brightness == Brightness.dark) {
          _themeMode = ThemeMode.dark;
        } else {
          _themeMode = ThemeMode.light;
        }
      }
    });

    SecureStorage.instance
        .read(SecureStorageKeys.appLang.toString())
        .then((value) {
      if (value != null) {
        _appLanguage =
            AppLanguage.values.firstWhere((element) => element.name == value);
      } else {
        final String defaultLocale = Platform.localeName;
        if (defaultLocale.contains("vi")) {
          _appLanguage = AppLanguage.vn;
        } else if (defaultLocale.contains("in")) {
          _appLanguage = AppLanguage.india;
        } else if (defaultLocale.contains("ko")) {
          _appLanguage = AppLanguage.ko;
        } else if (defaultLocale.contains("ja")) {
          _appLanguage = AppLanguage.ja;
        } else if (defaultLocale.contains("zh")) {
          _appLanguage = AppLanguage.zh;
        } else if (defaultLocale.contains("pt_BR")) {
          _appLanguage = AppLanguage.pt_br;
        } else if (defaultLocale.contains("th")) {
          _appLanguage = AppLanguage.th;
        } else if (defaultLocale.contains("ru")) {
          _appLanguage = AppLanguage.ru;
        } else if (defaultLocale.contains("ms")) {
          _appLanguage = AppLanguage.ms;
        } else if (defaultLocale.contains("id")) {
          _appLanguage = AppLanguage.id;
        } else {
          _appLanguage = AppLanguage.en;
        }
      }
      notifyListeners();
    });
  }

  void setRequestUpdateVersionKey(bool value) {
    _requestUpdateVersionKey = value;
    notifyListeners();
  }

  void setModeTheme(ThemeMode mode) {
    _themeMode = mode;
    SecureStorage.instance.save(
        SecureStorageKeys.themMode.toString(),
        _themeMode.name == ThemeMode.system.name
            ? ThemeMode.light.name
            : _themeMode.name);
    notifyListeners();
  }

  void language(AppLanguage value) {
    _appLanguage = value;
    SecureStorage.instance
        .save(SecureStorageKeys.appLang.toString(), value.name);
    notifyListeners();
  }

  HashMap get languageMap {
    switch (_appLanguage) {
      case AppLanguage.en:
        return languageEn;
      case AppLanguage.india:
        return languageIndia;
      case AppLanguage.ko:
        return languageKorea;
      case AppLanguage.ja:
        return languageJapan;
      case AppLanguage.zh:
        return languageChina;
      case AppLanguage.pt_br:
        return languageBrazilianPortuguese;
      case AppLanguage.th:
        return languageThailand;
      case AppLanguage.ru:
        return languageRussia;
      case AppLanguage.ms:
        return languageMalaysia;
      case AppLanguage.id:
        return languageIndo;
      default:
        return languageVn;
    }
  }

  Future<void> setAutoLock(bool isOpen, int time) async {
    await SecureStorage.instance
        .save(SecureStorageKeys.isAutoLock.toString(), isOpen.toString());
    await SecureStorage.instance
        .save(SecureStorageKeys.timeAutoLock.toString(), time.toString());
    _isOpenAutoLock = isOpen;
    _timeAutoLock = time;
    if (isOpen) {
      initializeTimer();
    } else {
      _rootTimer.cancel();
    }
    notifyListeners();
  }

  Future<void> initializeTimer() async {
    _rootTimer.cancel();
    final autoLock = await SecureStorage.instance
        .read(SecureStorageKeys.isAutoLock.toString());
    final timeAutoLock = await SecureStorage.instance
            .read(SecureStorageKeys.timeAutoLock.toString()) ??
        "5";
    _timeAutoLock = int.parse(timeAutoLock);
    if (autoLock == null || autoLock == "false") {
      _isOpenAutoLock = false;
      return;
    }
    _isOpenAutoLock = true;
    Duration time = Duration(minutes: _timeAutoLock);
    _rootTimer = Timer(time, () {
      logOutUser();
    });
    log("initializeTimer: $_timeAutoLock");
  }

  void logOutUser() async {
    _rootTimer.cancel();
    Navigator.of(GlobalKeys.appRootNavigatorKey.currentContext!)
        .pushNamedAndRemoveUntil(RoutePaths.localAuthRoute, (route) => false);
  }

  void handleUserInteraction([_]) {
    if (!_rootTimer.isActive) {
      return;
    }
    _rootTimer.cancel();
    initializeTimer();
  }
}
