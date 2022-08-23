import 'package:artist_top_tracks/src/domain/entities/track_entity.dart';

class ResponseEntity {
  final List<TrackEntity> trackEntity;
  ResponseEntity({
    required this.trackEntity,
  });
}
