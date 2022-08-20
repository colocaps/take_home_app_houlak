import 'package:core/core.dart';
import 'package:home_search/src/domain/entities/artist_entity.dart';
import 'package:home_search/src/domain/entities/item_entity.dart';
import 'package:home_search/src/domain/entities/results_entity.dart';
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
        final search = _mapToArtistEntity(response.data);
        return HomeSearchOutput.withData(artistEntity: search);
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

  static ArtistEntity _mapToArtistEntity(Map<String, dynamic> value) {
    return ArtistEntity(
      resultsEntity: _mapToResultsEntity(value),
    );
  }

  static List<ItemEntity> _mapToItemEntity(List<dynamic> list) {
    return list
        .map(
          (json) => ItemEntity(
              id: json['id'],
              imagesEntity: _mapToImages(json['images']),
              name: json['name']),
        )
        .toList();
  }

  static ResultsEntity _mapToResultsEntity(Map<String, dynamic> value) {
    var item = value['items'] as List<dynamic>;
    var itemList = _mapToItemEntity(item);

    return ResultsEntity(
      href: value['href'] ?? '',
      limit: value['limit'] ?? 0,
      next: value['next'] ?? '',
      offset: value['offset'] ?? 0,
      previous: value['previous'] ?? '',
      total: value['total'] ?? 0,
      itemEntityList: itemList,
    );
  }
}
