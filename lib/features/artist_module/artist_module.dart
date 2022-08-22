import 'package:artist_details/artist_details.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:houlak_take_home_app/features/artist_module/pages/artist_details_page.dart';

abstract class ArtistModule {
  static late final NavigationManager _navigationManager;

  static registerDependencies() async {
    _navigationManager =
        InjectorContainer.instance.resolve<NavigationManager>();
    await ArtistDetailsInitializer.registerDependencies();
  }

  static const String artistDetailsRoute = '/artist-details';

  static Map<String, WidgetBuilder> generateRoutes() {
    return {
      artistDetailsRoute: (context) => const ArtistDetailsPage(),
    };
  }

  static Future<T?> navigateToArtistDetailsPage<T, TArgs>(
    BuildContext context,
    TArgs args,
  ) {
    return _navigationManager.navigateToWithArgs(
      context,
      artistDetailsRoute,
      args,
    );
  }
}
