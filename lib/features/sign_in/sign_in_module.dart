import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:houlak_take_home_app/features/sign_in/pages/sign_in_page.dart';

abstract class SignInModule {
  static late final NavigationManager _navigationManager;

  static registerDependencies() {
    _navigationManager =
        InjectorContainer.instance.resolve<NavigationManager>();
  }

  static const String signInRoute = '/sign-in';

  static Map<String, WidgetBuilder> generateRoutes() {
    return {
      signInRoute: (context) => const SignInPage(),
    };
  }

  static Future<T?> navigateToSignIn<T>(BuildContext context) {
    return _navigationManager.navigateTo(context, signInRoute);
  }
}
