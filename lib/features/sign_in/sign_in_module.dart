import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:houlak_take_home_app/features/sign_in/pages/sign_in_page.dart';
import 'package:sign_in/sign_in.dart';

abstract class SignInModule {
  static late final NavigationManager _navigationManager;

  static registerDependencies() async {
    _navigationManager =
        InjectorContainer.instance.resolve<NavigationManager>();
    await SignInInitializer.registerDependencies();
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
