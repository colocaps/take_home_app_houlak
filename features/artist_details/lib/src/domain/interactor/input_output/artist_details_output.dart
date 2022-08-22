import 'package:artist_details/src/domain/entities/response_entity.dart';

class ArtistDetailsOutput {
  final ResponseEntity? responseEntity;
  late List<String>? errors = [];

  ArtistDetailsOutput.withData({
    required this.responseEntity,
  });

  ArtistDetailsOutput.withErrors({
    required this.errors,
    this.responseEntity,
  });

  bool get hasErrors => errors?.isNotEmpty ?? false;
}
