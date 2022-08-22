import 'package:artist_top_tracks/src/domain/entities/album_entity.dart';
import 'package:artist_top_tracks/src/domain/entities/artist_entity.dart';

class TrackEntity {
  final AlbumEntity album;
  final List<ArtistEntity> artistList;
  final String trackId;
  final String tackName;
  final int trackPopularity;
  final String previewUrl;
  TrackEntity({
    required this.album,
    required this.artistList,
    required this.trackId,
    required this.tackName,
    required this.trackPopularity,
    required this.previewUrl,
  });
}
