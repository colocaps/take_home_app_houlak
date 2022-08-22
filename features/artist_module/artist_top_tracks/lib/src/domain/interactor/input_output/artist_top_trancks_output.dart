import 'package:artist_top_tracks/src/domain/entities/track_entity.dart';

class ArtistTopTracksOutput {
  final TrackEntity? trackEntity;
  late List<String>? errors = [];

  ArtistTopTracksOutput.withData({
    required this.trackEntity,
  });

  ArtistTopTracksOutput.withErrors({
    required this.errors,
    this.trackEntity,
  });

  bool get hasErrors => errors?.isNotEmpty ?? false;
}
