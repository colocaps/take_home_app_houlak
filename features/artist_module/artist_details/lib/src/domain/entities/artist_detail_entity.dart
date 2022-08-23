import 'package:artist_details/src/domain/entities/images_entity.dart';

class ArtistDetailsEntity {
  final String href;
  final List<dynamic> genresList;
  final String id;
  final List<ImagesEntity> imagesList;
  final String name;
  final int popularity;

  ArtistDetailsEntity({
    required this.href,
    required this.genresList,
    required this.id,
    required this.imagesList,
    required this.name,
    required this.popularity,
  });
}
