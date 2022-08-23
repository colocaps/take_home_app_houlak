import 'package:artist_top_tracks/src/domain/entities/track_entity.dart';
import 'package:artist_top_tracks/src/presentation/widgets/build_track_card.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ArtistTopTracksBuildLoaded extends StatelessWidget {
  final AudioManager _audioManager;
  final List<TrackEntity> _trackEntity;

  const ArtistTopTracksBuildLoaded({
    Key? key,
    required AudioManager audioManager,
    required List<TrackEntity> trackEntity,
  })  : _audioManager = audioManager,
        _trackEntity = trackEntity,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Top 5 tracks',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 340,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (_, int index) {
                  return BuildTrackCard(
                    trackEntity: _trackEntity[index],
                    audioManager: _audioManager,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
