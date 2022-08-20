import 'package:home_search/src/domain/entities/track_entity.dart';

class ItemEntity {
  final FollowersEntity? followersEntity;
  final List<ImagesEntity> imagesEntity;
  final String name;
  final int? popularity;
  final String? type;
  final AlbumEntity albumEntity;
  ItemEntity({
    this.followersEntity,
    required this.imagesEntity,
    required this.name,
    this.popularity,
    this.type,
    required this.albumEntity,
  });
}

class FollowersEntity {
  final String href;
  final int total;
  FollowersEntity({
    required this.href,
    required this.total,
  });
}

class ImagesEntity {
  final double heigth;
  final double width;
  final String url;
  ImagesEntity({
    required this.heigth,
    required this.width,
    required this.url,
  });
}
