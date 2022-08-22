import 'package:artist_details/src/domain/entities/artist_detail_entity.dart';

class ArtistDetailsOutput {
  final ArtistDetailsEntity? artistDetailsEntity;
  late List<String>? errors = [];

  ArtistDetailsOutput.withData({
    required this.artistDetailsEntity,
  });

  ArtistDetailsOutput.withErrors({
    required this.errors,
    this.artistDetailsEntity,
  });

  bool get hasErrors => errors?.isNotEmpty ?? false;
}
