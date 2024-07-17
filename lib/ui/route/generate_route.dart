import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cyber_safe/ui/route.dart';
import 'package:cyber_safe/ui/screens.dart';

class AppGenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget? widget;

    switch (settings.name) {
      case RoutePaths.homeRoute:
        widget = const HomeScreen();
        break;
      case RoutePaths.onboardingRoute:
        widget = const OnboardingScreen();
        break;
      case RoutePaths.registerRoute:
        widget = const RegisterScreen();
        break;
      case RoutePaths.localAuthRoute:
        widget = const LocalAuthScreen();
        break;
      case RoutePaths.settingRoute:
        widget = const SettingScreen();
        break;
      case RoutePaths.detailsAccountRoute:
        final args = settings.arguments as Map<String, dynamic>;
        widget = DetailsAccountScreen(
          id: args['id'],
        );
        break;
      case RoutePaths.updateAccountRoute:
        final args = settings.arguments as Map<String, dynamic>;
        widget = UpdateAccountScreen(
          id: args['id'],
        );
        break;
      case RoutePaths.categoryManagerRoute:
        widget = const CategoryManagerScreen();
        break;

      case RoutePaths.passGenRoute:
        widget = const PassGenScreen();
        break;

      case RoutePaths.privacyPolicyRoute:
        widget = const PrivacyPolicyScreen();
        break;
      case RoutePaths.termsOfServiceRoute:
        widget = const TermsOfServiceScreen();
        break;
      case RoutePaths.aboutRoute:
        widget = const AboutAppScreen();
        break;
      case RoutePaths.fqaRoute:
        widget = const FqaScreen();
        break;
      default:
        widget = Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
    return Platform.isIOS
        ? CupertinoPageRoute(
            settings: RouteSettings(name: settings.name),
            builder: (context) => widget!)
        : PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, a1, a2) => widget!,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          );
  }
}
