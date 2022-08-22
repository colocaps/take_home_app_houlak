import 'package:artist_top_tracks/src/domain/entities/album_entity.dart';
import 'package:artist_top_tracks/src/domain/entities/artist_entity.dart';
import 'package:artist_top_tracks/src/domain/entities/image_entity.dart';
import 'package:artist_top_tracks/src/domain/entities/response_entity.dart';
import 'package:artist_top_tracks/src/domain/entities/track_entity.dart';
import 'package:artist_top_tracks/src/domain/interactor/input_output/artist_top_trancks_output.dart';
import 'package:artist_top_tracks/src/domain/interactor/input_output/artist_top_trancks_input.dart';
import 'package:artist_top_tracks/src/domain/repositories/artist_top_tracks_remote_repository.dart';
import 'package:core/core.dart';

class ArtistTopTracksRemoteRepositoryImpl
    implements ArtistTopTracksRemoteRepository {
  final String _baseUrl;
  final DioManager _dioManager;

  ArtistTopTracksRemoteRepositoryImpl({
    required String baseUrl,
    required DioManager dioManager,
  })  : _baseUrl = baseUrl,
        _dioManager = dioManager;

  static const String artistTopTracksEndpoint = '/artists/';
  String getArtistTopTracksUrl() => '$_baseUrl$artistTopTracksEndpoint';
  final List<String> _errors = [];

  @override
  Future<ArtistTopTracksOutput> getArtistTopTracks(
      ArtistTopTracksInput input) async {
    final url =
        '${getArtistTopTracksUrl()}${input.artistId}/top-tracks?market=${input.market}';
    final response = await _dioManager.get(
      url,
      input.token,
    );
    if (response != null) {
      if (response.isOk()) {
        final search = _mapToResponseEntity(response.data);
        return ArtistTopTracksOutput.withData(
          responseEntity: search,
        );
      } else {
        _errors.add(
          response.statusCode.toString(),
        );
      }
      return ArtistTopTracksOutput.withErrors(
        errors: _errors,
      );
    } else {
      _errors.add(
        'server error',
      );
      return ArtistTopTracksOutput.withErrors(
        errors: _errors,
      );
    }
  }

  static ResponseEntity _mapToResponseEntity(Map<String, dynamic> value) {
    return ResponseEntity(
      trackEntity: _mapToTrackEntityList(value['tracks']),
    );
  }

  static List<TrackEntity> _mapToTrackEntityList(List<dynamic> list) {
    return list
        .map(
          (json) => TrackEntity(
            album: _mapToAlbumEntity(json['album']),
            artistList: _mapToArtist(json['artists']),
            trackId: json['id'] ?? '',
            tackName: json['name'] ?? 'unknown name',
            trackPopularity: json['popularity'] ?? 0,
            previewUrl: json['preview_url'] ?? '',
          ),
        )
        .toList();
  }

  static AlbumEntity _mapToAlbumEntity(Map<String, dynamic> value) {
    return AlbumEntity(
      albumId: value['id'],
      imagesList: _mapToImages(value['images']),
      artistList: _mapToArtist(value['artists']),
      albumName: value['name'],
      releaseDate: value['release_date'],
      totalTracks: value['total_tracks'],
    );
  }

  static List<ArtistEntity> _mapToArtist(List<dynamic> list) {
    return list
        .map(
          (json) => ArtistEntity(
            artistId: json['id'],
            artistName: json['name'],
            href: json['href'],
          ),
        )
        .toList();
  }

  static List<ImageEntity> _mapToImages(List<dynamic> list) {
    return list
        .map(
          (json) => ImageEntity(
            heigth: json['height'] ?? 0,
            width: json['width'] ?? 0,
            url: json['url'] ??
                'https://st.depositphotos.com/1987177/3470/v/450/depositphotos_34700099-stock-illustration-no-photo-available-or-missing.jpg',
          ),
        )
        .toList();
  }
}
