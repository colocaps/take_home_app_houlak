


import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome_label => 'Welcome';

  @override
  String get sign_in_title => 'Spotify artist searcher';

  @override
  String get sign_in_button_text => 'Sign in with Spotify';

  @override
  String get cancel_by_user => 'Cancel by user';

  @override
  String get are_you_sure_of_closing_app => 'Are you sure of closing the app ?';

  @override
  String get cancel => 'Cancel';

  @override
  String get are_you_sure_of_sign_out => 'Are you sure of signing out ?';

  @override
  String get thank_you => 'Thanks for using our App!';
}
