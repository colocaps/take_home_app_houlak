import 'package:artist_top_tracks/src/domain/entities/artist_entity.dart';
import 'package:artist_top_tracks/src/domain/entities/image_entity.dart';

class AlbumEntity {
  final String albumId;
  final List<ImageEntity> imagesList;
  final List<ArtistEntity> artistList;
  final String albumName;
  final String releaseDate;
  final int totalTracks;
  AlbumEntity({
    required this.albumId,
    required this.imagesList,
    required this.artistList,
    required this.albumName,
    required this.releaseDate,
    required this.totalTracks,
  });
}
