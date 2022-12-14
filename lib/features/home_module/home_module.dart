import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home_search/home_search.dart';
import 'package:houlak_take_home_app/features/home_module/pages/home_page.dart';

abstract class HomeModule {
  static late final NavigationManager _navigationManager;

  static registerDependencies() async {
    _navigationManager =
        InjectorContainer.instance.resolve<NavigationManager>();
    await HomeSearhcInitializer.registerDependencies();
  }

  static const String homeRoute = '/home';

  static Map<String, WidgetBuilder> generateRoutes() {
    return {
      homeRoute: (context) => const HomePage(),
    };
  }

  static Future<T?> navigateToHome<T, TArgs>(
    BuildContext context,
    TArgs args,
  ) {
    return _navigationManager.navigateToWithArgs(
      context,
      homeRoute,
      args,
    );
  }
}
