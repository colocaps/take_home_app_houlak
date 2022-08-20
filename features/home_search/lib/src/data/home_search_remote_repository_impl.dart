import 'package:core/core.dart';
import 'package:home_search/src/domain/entities/album_entity.dart';
import 'package:home_search/src/domain/entities/artist_entity.dart';
import 'package:home_search/src/domain/entities/episode_entity.dart';
import 'package:home_search/src/domain/entities/item_entity.dart';
import 'package:home_search/src/domain/entities/playlist_entity.dart';
import 'package:home_search/src/domain/entities/response_entity.dart';
import 'package:home_search/src/domain/entities/results_entity.dart';
import 'package:home_search/src/domain/entities/show_entity.dart';
import 'package:home_search/src/domain/entities/track_entity.dart';
import 'package:home_search/src/domain/interactor/input_output/home_search_input.dart';
import 'package:home_search/src/domain/interactor/input_output/home_search_output.dart';
import 'package:home_search/src/domain/repositories/home_search_remote_repository.dart';

class HomeSearchRemoteRepositoryImpl implements HomeSearchRemoteRepository {
  final String _baseUrl;
  final DioManager _dioManager;

  HomeSearchRemoteRepositoryImpl({
    required String baseUrl,
    required DioManager dioManager,
  })  : _baseUrl = baseUrl,
        _dioManager = dioManager;

  static const String searchEndpoint = '/search';
  String getPopularMoviesUrl() => '$_baseUrl$searchEndpoint';
  final List<String> _errors = [];

  @override
  Future<HomeSearchOutput> getHomeSearchResponse(HomeSearchInput input) async {
    final url =
        '${getPopularMoviesUrl()}?q=${input.query}&type=${input.type[0]}';
    final response = await _dioManager.get(
      url,
      input.token,
    );

    if (response != null) {
      if (response.isOk()) {
        final search = _mapToResponseEntity(response.data);
        return HomeSearchOutput.withData(responseEntity: search);
      } else {
        _errors.add(
          response.statusCode.toString(),
        );
      }
      return HomeSearchOutput.withErrors(
        errors: _errors,
      );
    } else {
      _errors.add(
        'server error',
      );
      return HomeSearchOutput.withErrors(
        errors: _errors,
      );
    }
  }

  static ResponseEntity _mapToResponseEntity(Map<String, dynamic> value) {
    return ResponseEntity(
      trackEntity: _mapToTacksEntity(value["tracks"]),
      artistEntity: _mapToArtistEntity(value["artists"]),
      albumEntity: _mapToAlbumsEntity(value["albums"]),
      playlistEntity: _mapToPlaulistEntity(value["playlists"]),
      showEntity: _mapToShowEntity(value["shows"]),
      episodeEntity: _mapToEpisodeEntity(value["episodes"]),
    );
  }

  static TrackEntity _mapToTacksEntity(Map<String, dynamic> value) {
    return TrackEntity(
      resultsEntity: _mapToResultsEntity(value),
    );
  }

  static EpisodeEntity _mapToEpisodeEntity(Map<String, dynamic> value) {
    return EpisodeEntity(
      resultsEntity: _mapToResultsEntity(value),
    );
  }

  static ShowEntity _mapToShowEntity(Map<String, dynamic> value) {
    return ShowEntity(
      resultsEntity: _mapToResultsEntity(value),
    );
  }

  static PlaylistEntity _mapToPlaulistEntity(Map<String, dynamic> value) {
    return PlaylistEntity(
      resultsEntity: _mapToResultsEntity(value),
    );
  }

  static AlbumEntity _mapToAlbumsEntity(Map<String, dynamic> value) {
    return AlbumEntity(
      resultsEntity: _mapToResultsEntity(value),
    );
  }

  static ArtistEntity _mapToArtistEntity(Map<String, dynamic> value) {
    return ArtistEntity(
      resultsEntity: _mapToResultsEntity(value),
    );
  }

  static ResultsEntity _mapToResultsEntity(Map<String, dynamic> value) {
    return ResultsEntity(
      href: value['href'] ?? '',
      limit: value['limit'] ?? 0,
      next: value['next'] ?? '',
      offset: value['offset'] ?? 0,
      previous: value['previous'] ?? '',
      total: value['total'] ?? 0,
    );
  }
}
