import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:houlak_take_home_app/features/home_module/home_module.dart';
import 'package:sign_in/sign_in.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      body: WillPopScope(
        onWillPop: () async {
          _areYouSure(context, () {
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else if (Platform.isIOS) {
              exit(0);
            }
          });
          return false;
        },
        child: SignInComponent(
          signInCubit: signInCubit,
          webAuth: webAuth,
          onSignInCorrect: HomeModule.navigateToHome,
          customTopSnackBarManager: customTopSnackBarManager,
          buttonText: AppLocalizations.of(context)!.sign_in_button_text,
          titleText: AppLocalizations.of(context)!.sign_in_title,
          cancelText: AppLocalizations.of(context)!.cancel_by_user,
          welcomeText: AppLocalizations.of(context)!.welcome_label,
        ),
      ),
    );
  }

  void _areYouSure(
    BuildContext context,
    VoidCallback okAction,
  ) {
    AlertDialogUtils.showAlertWithTwoActions(
      context: context,
      image: Image.asset(
        'assets/images/loading.gif',
        package: 'core',
        height: 80,
        width: 80,
      ),
      title: AppLocalizations.of(context)!.are_you_sure_of_sign_out,
      subtitle: '',
      okAction: okAction,
      titleOkButton: 'OK',
      cancelAction: () {
        Navigator.pop(context);
      },
      titleCancelButton: AppLocalizations.of(context)!.cancel,
      theme: Theme.of(context),
    );
  }
}
