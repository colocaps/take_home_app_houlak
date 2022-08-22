import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:houlak_take_home_app/features/artist_module/artist_module.dart';
import 'package:houlak_take_home_app/features/home_module/home_module.dart';
import 'package:houlak_take_home_app/features/sign_in/sign_in_module.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignInModule.signInRoute,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', ''),
        Locale('en', ''),
      ],
      theme: ApplicationTheme.dark,
      routes: _generateRoutes(),
    );
  }

  Map<String, WidgetBuilder> _generateRoutes() {
    return {
      ...HomeModule.generateRoutes(),
      ...SignInModule.generateRoutes(),
      ...ArtistModule.generateRoutes(),
    };
  }
}
