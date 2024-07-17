import 'dart:async';
import 'dart:io';

import 'package:cyber_safe/core/objectbox_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get_it/get_it.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:cyber_safe/core/service_locator.dart';
import 'package:cyber_safe/core/utils.dart';
import 'package:cyber_safe/ui/provider.dart';
import 'package:cyber_safe/ui/route.dart';
import 'package:secure_application/secure_application.dart';
import 'package:timezone/data/latest.dart' as timezone;
import 'package:intl/date_symbol_data_local.dart';
import 'package:upgrader/upgrader.dart';

String currentThemeMode = "";
late String numberLogins;
GetIt locator = GetIt.instance;
final InAppReview inAppReview = InAppReview.instance;
late final PackageInfo packageInfo;
Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  ServiceLocator.instance.registerDependencies();
  final String defaultLocale = Platform.localeName;
  await Upgrader.clearSavedSettings();
  await initializeDateFormatting(defaultLocale, null);
  await LocalAuthConfig.instance.init();
  await SecureApplicationUtil.instance.init();
  timezone.initializeTimeZones();
  await ObjectboxStack.instance.create();
  packageInfo = await PackageInfo.fromPlatform();
  await reviewApp();
  runApp(
    const MainApp(),
  );
}

reviewApp() async {
  numberLogins =
      await SecureStorage.instance.read(SecureStorageKeys.numberLogin.name) ??
          "0";
  await SecureStorage.instance.save(SecureStorageKeys.numberLogin.name,
      (int.parse(numberLogins) + 1).toString());
  if (int.parse(numberLogins) != 0 && int.parse(numberLogins) % 5 == 0) {
    if (await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    }
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => MainAppState();

  static MainAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MainAppState>();
}

class MainAppState extends State<MainApp> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  void dispose() {
    super.dispose();
    SecureApplicationUtil.instance.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => RootPR(),
        ),
        ChangeNotifierProvider(create: (context) => DataShared.instance)
      ],
      child: Consumer<RootPR>(
          builder: (ctx, rootProvider, _) => StyledToast(
                textStyle: const TextStyle(fontSize: 16.0, color: Colors.white),
                backgroundColor: const Color(0x99000000),
                locale: const Locale('en', 'US'),
                borderRadius: BorderRadius.circular(5.0),
                textPadding: const EdgeInsets.symmetric(
                    horizontal: 17.0, vertical: 10.0),
                toastAnimation: StyledToastAnimation.size,
                reverseAnimation: StyledToastAnimation.size,
                duration: const Duration(seconds: 3),
                animDuration: const Duration(milliseconds: 300),
                startOffset: const Offset(0.0, -1.0),
                reverseEndOffset: const Offset(0.0, -1.0),
                alignment: Alignment.topCenter,
                toastPositions: StyledToastPosition.top,
                curve: Curves.fastOutSlowIn,
                reverseCurve: Curves.fastOutSlowIn,
                fullWidth: false,
                isHideKeyboard: false,
                isIgnoring: true,
                child: Listener(
                  behavior: HitTestBehavior.translucent,
                  onPointerDown: rootProvider.handleUserInteraction,
                  onPointerMove: rootProvider.handleUserInteraction,
                  onPointerUp: rootProvider.handleUserInteraction,
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    themeMode: rootProvider.themeMode,
                    navigatorKey: GlobalKeys.appRootNavigatorKey,
                    title: 'password manager pro',
                    initialRoute: RoutePaths.onboardingRoute,
                    onGenerateRoute: AppGenerateRoute.generateRoute,
                    // initialRoute: RoutePaths.localAuthRoute,
                    theme: ThemeData(
                      colorScheme: ColorScheme(
                        shadow:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                        brightness: Brightness.light,
                        error: const Color.fromARGB(255, 129, 21, 21),
                        onError: const Color(0xFF000000),
                        onPrimary: const Color(0xFFFFFFFF),
                        onSecondary: const Color(0xFF000000),
                        onSurface: const Color(0xFF000000),
                        primary: const Color(0xFF2D5BD3),
                        secondary: const Color(0xFFE9E9E9),
                        surface: const Color(0xFFE9E9E9),
                        surfaceContainerHighest:
                            const Color.fromARGB(255, 219, 219, 219),
                        secondaryContainer: const Color(0xFFFFFFFF),
                      ),
                    ),
                    darkTheme: ThemeData(
                      colorScheme: ColorScheme(
                        shadow: const Color.fromARGB(255, 191, 191, 191)
                            .withOpacity(0.1),
                        brightness: Brightness.dark,
                        error: const Color(0xFFCF6679),
                        onError: const Color(0xFFFFFFFF),
                        onPrimary: const Color(0xFFFFFFFF),
                        onSecondary: const Color(0xFFFFFFFF),
                        onSurface: const Color(0xFFFFFFFF),
                        primary: const Color(0xFF2D5BD3),
                        secondary: const Color(0xFF121212),
                        surface: const Color(0xFF121212),
                        secondaryContainer: const Color(0xFF212121),
                        surfaceContainerHighest:
                            const Color.fromARGB(255, 42, 42, 42),
                      ),
                    ),
                    builder: (context, child) {
                      return SecureApplication(
                        secureApplicationController: SecureApplicationUtil
                            .instance.secureApplicationController,
                        child: MediaQuery(
                          data: MediaQuery.of(context)
                              .copyWith(textScaler: const TextScaler.linear(1)),
                          child: ColoredBox(
                            color: Theme.of(context).colorScheme.surface,
                            child: SafeArea(
                              bottom: false,
                              right: false,
                              left: false,
                              child: AnnotatedRegion(
                                  value: SystemUiOverlayStyle(
                                    statusBarColor:
                                        Theme.of(context).colorScheme.surface,
                                    statusBarBrightness:
                                        rootProvider.themeMode ==
                                                ThemeMode.light
                                            ? Brightness.light
                                            : Brightness.dark,
                                    statusBarIconBrightness:
                                        rootProvider.themeMode ==
                                                ThemeMode.light
                                            ? Brightness.dark
                                            : Brightness.light,
                                  ),
                                  child: child!),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )),
    );
  }
}
