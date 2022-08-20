import 'package:core/core.dart';
import 'package:home_search/src/domain/entities/artist_entity.dart';
import 'package:home_search/src/domain/entities/item_entity.dart';
import 'package:home_search/src/domain/entities/response_entity.dart';
import 'package:home_search/src/domain/entities/results_entity.dart';
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
      trackEntity: _mapToTacksEntity(value["tracks"] ?? {}),
      artistEntity: _mapToArtistEntity(value["artists"] ?? {}),
    );
  }

  static TrackEntity _mapToTacksEntity(Map<String, dynamic> value) {
    var items = value["items"] as List<dynamic>;
    var itemList = _mapToTacksItem(items);
    return TrackEntity(
      resultsEntity: _mapToResultsEntity(value),
      itemList: itemList,
    );
  }

  static List<TrackItem> _mapToTacksItem(List<dynamic> list) {
    return list
        .map(
          (json) => TrackItem(
              albumEntity: _mapToAlbumEntity(json['album']),
              artistList: _mapToArtist(json['artists']),
              name: json['name']),
        )
        .toList();
  }

  static AlbumEntity _mapToAlbumEntity(Map<String, dynamic> value) {
    var artist = value["artists"] as List<dynamic>;
    var artistList = _mapToArtist(artist);
    return AlbumEntity(
      albumType: value['album_type'],
      artist: artistList,
    );
  }

  static List<ImagesEntity> _mapToImages(List<dynamic> list) {
    return list
        .map(
          (json) => ImagesEntity(
            heigth: json['heigth'],
            width: json['width'],
            url: json['url'],
          ),
        )
        .toList();
  }

  static List<Artist> _mapToArtist(List<dynamic> list) {
    return list
        .map(
          (json) => Artist(
            id: json['id'],
            name: json['name'],
            type: json['type'],
          ),
        )
        .toList();
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
