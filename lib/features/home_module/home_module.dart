import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:houlak_take_home_app/features/home_module/pages/home_page.dart';

abstract class HomeModule {
  static late final NavigationManager _navigationManager;

  static const String homeRoute = '/home';

  static Map<String, WidgetBuilder> generateRoutes() {
    return {
      homeRoute: (context) => const HomePage(),
    };
  }

  static Future<T?> navigateToHome<T>(BuildContext context) {
    return _navigationManager.navigateTo(context, homeRoute);
  }
}
