import 'package:artist_details/artist_details.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ArtistDetailsPage extends StatelessWidget {
  const ArtistDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;
    var artistDetailsCubit =
        InjectorContainer.instance.resolve<ArtistDetailsCubit>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: ArtistDetailsComponent(
            artistDetailsCubit: artistDetailsCubit,
            artistId: args[0],
            token: args[1],
          ),
        ),
      ),
    );
  }
}
