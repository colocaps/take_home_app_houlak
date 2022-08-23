import 'package:artist_details/artist_details.dart';
import 'package:artist_top_tracks/artist_top_tracks.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ArtistDetailsPage extends StatelessWidget {
  const ArtistDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;
    var artistDetailsCubit =
        InjectorContainer.instance.resolve<ArtistDetailsCubit>();
    var audioManager = InjectorContainer.instance.resolve<AudioManager>();
    var artistTopTracksCubit =
        InjectorContainer.instance.resolve<ArtistTopTracksCubit>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: ArtistDetailsComponent(
            artistDetailsCubit: artistDetailsCubit,
            artistId: args[0],
            token: args[1],
            artistTopTracksComponent: ArtistTopTracksComponent(
              artistTopTracksCubit: artistTopTracksCubit,
              artistId: args[0],
              market: 'ES',
              token: args[1],
              audioManager: audioManager,
            ),
          ),
        ),
      ),
    );
  }
}
