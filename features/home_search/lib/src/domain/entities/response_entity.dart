import 'package:home_search/src/domain/entities/artist_entity.dart';
import 'package:home_search/src/domain/entities/episode_entity.dart';
import 'package:home_search/src/domain/entities/playlist_entity.dart';
import 'package:home_search/src/domain/entities/show_entity.dart';
import 'package:home_search/src/domain/entities/track_entity.dart';

class ResponseEntity {
  final TrackEntity? trackEntity;
  final ArtistEntity? artistEntity;

  final PlaylistEntity? playlistEntity;
  final ShowEntity? showEntity;
  final EpisodeEntity? episodeEntity;
  ResponseEntity({
    this.trackEntity,
    this.artistEntity,
    this.playlistEntity,
    this.showEntity,
    this.episodeEntity,
  });
}
