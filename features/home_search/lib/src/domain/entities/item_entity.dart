class ItemEntity {
  final FollowersEntity? followersEntity;
  final List<ImagesEntity> imagesEntity;
  final String id;
  final String name;
  final int? popularity;
  final String? type;

  ItemEntity({
    this.followersEntity,
    required this.imagesEntity,
    required this.name,
    this.popularity,
    this.type,
    required this.id,
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
  final int heigth;
  final int width;
  final String url;
  ImagesEntity({
    required this.heigth,
    required this.width,
    required this.url,
  });
}
