import 'package:artist_top_tracks/src/domain/entities/response_entity.dart';

class ArtistTopTracksOutput {
  final ResponseEntity? responseEntity;
  late List<String>? errors = [];

  ArtistTopTracksOutput.withData({
    required this.responseEntity,
  });

  ArtistTopTracksOutput.withErrors({
    required this.errors,
    this.responseEntity,
  });

  bool get hasErrors => errors?.isNotEmpty ?? false;
}
