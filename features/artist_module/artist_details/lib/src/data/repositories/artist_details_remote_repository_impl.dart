import 'package:artist_details/src/domain/entities/artist_detail_entity.dart';
import 'package:artist_details/src/domain/entities/images_entity.dart';
import 'package:artist_details/src/domain/interactor/input_output/artist_details_output.dart';
import 'package:artist_details/src/domain/interactor/input_output/artist_details_input.dart';
import 'package:artist_details/src/domain/repositories/artist_details_remote_repository.dart';
import 'package:core/core.dart';

class ArtistDetailsRemoteRepositoryImpl
    implements ArtistDetailsRemoteRepository {
  final String _baseUrl;
  final DioManager _dioManager;

  ArtistDetailsRemoteRepositoryImpl({
    required String baseUrl,
    required DioManager dioManager,
  })  : _baseUrl = baseUrl,
        _dioManager = dioManager;

  static const String artistDetailsEndpoint = '/artists/';
  String getDetailsArtistUrl() => '$_baseUrl$artistDetailsEndpoint';
  final List<String> _errors = [];

  @override
  Future<ArtistDetailsOutput> getArtistDetails(ArtistDetailsInput input) async {
    final url = getDetailsArtistUrl() + input.artistId;
    final response = await _dioManager.get(
      url,
      input.token,
    );
    if (response != null) {
      if (response.isOk()) {
        final artistDetail = _mapToArtistDetailsEntity(response.data);
        return ArtistDetailsOutput.withData(
          artistDetailsEntity: artistDetail,
        );
      } else {
        _errors.add(
          response.statusCode.toString(),
        );
      }
      return ArtistDetailsOutput.withErrors(
        errors: _errors,
      );
    } else {
      _errors.add(
        'server error',
      );
      return ArtistDetailsOutput.withErrors(
        errors: _errors,
      );
    }
  }

  static ArtistDetailsEntity _mapToArtistDetailsEntity(
      Map<String, dynamic> value) {
    var images = value['images'] as List<dynamic>;
    var imagesList = _mapToImages(images);

    return ArtistDetailsEntity(
      href: value['href'] ?? '',
      genresList: value['genres'],
      id: value['id'],
      imagesList: imagesList,
      name: value['name'],
      popularity: value['popularity'],
    );
  }

  static List<ImagesEntity> _mapToImages(List<dynamic> list) {
    return list
        .map(
          (json) => ImagesEntity(
            heigth: json['height'] ?? 0,
            width: json['width'] ?? 0,
            url: json['url'] ??
                'https://st.depositphotos.com/1987177/3470/v/450/depositphotos_34700099-stock-illustration-no-photo-available-or-missing.jpg',
          ),
        )
        .toList();
  }
}
