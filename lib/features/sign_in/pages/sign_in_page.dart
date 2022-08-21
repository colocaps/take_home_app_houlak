import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:houlak_take_home_app/features/home_module/home_module.dart';
import 'package:sign_in/sign_in.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var signInCubit = InjectorContainer.instance.resolve<SignInCubit>();
    var webAuth = InjectorContainer.instance.resolve<WebAuth>();
    var customTopSnackBarManager =
        InjectorContainer.instance.resolve<CustomTopSnackBarManager>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SignInComponent(
        signInCubit: signInCubit,
        webAuth: webAuth,
        onSignInCorrect: HomeModule.navigateToHome,
        customTopSnackBarManager: customTopSnackBarManager,
      ),
    );
  }
}
