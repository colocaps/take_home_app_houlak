import 'results_entity.dart';

class TrackEntity {
  final ResultsEntity resultsEntity;
  final List<TrackItem> itemList;
  TrackEntity({
    required this.resultsEntity,
    required this.itemList,
  });
}

class AlbumEntity {
  final String? albumType;
  final List<Artist>? artist;
  AlbumEntity({
    this.albumType,
    this.artist,
  });
}

class Artist {
  final String? id;
  final String? name;
  final String? type;
  Artist({
    this.id,
    this.name,
    this.type,
  });
}

class TrackItem {
  final AlbumEntity albumEntity;
  final List<Artist> artistList;
  final String name;
  TrackItem({
    required this.albumEntity,
    required this.artistList,
    required this.name,
  });
}
