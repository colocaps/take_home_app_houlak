import 'package:home_search/src/domain/entities/album_entity.dart';
import 'package:home_search/src/domain/entities/artist_entity.dart';
import 'package:home_search/src/domain/entities/episode_entity.dart';
import 'package:home_search/src/domain/entities/playlist_entity.dart';
import 'package:home_search/src/domain/entities/show_entity.dart';
import 'package:home_search/src/domain/entities/track_entity.dart';

class ResponseEntity {
  final TrackEntity trackEntity;
  final ArtistEntity artistEntity;
  final AlbumEntity albumEntity;
  final PlaylistEntity playlistEntity;
  final ShowEntity showEntity;
  final EpisodeEntity episodeEntity;
  ResponseEntity({
    required this.trackEntity,
    required this.artistEntity,
    required this.albumEntity,
    required this.playlistEntity,
    required this.showEntity,
    required this.episodeEntity,
  });
}
