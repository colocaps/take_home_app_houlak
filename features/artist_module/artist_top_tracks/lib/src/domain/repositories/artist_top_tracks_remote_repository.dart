import 'package:artist_top_tracks/src/domain/interactor/input_output/artist_top_trancks_input.dart';
import 'package:artist_top_tracks/src/domain/interactor/input_output/artist_top_trancks_output.dart';

abstract class ArtistTopTracksRemoteRepository {
  Future<ArtistTopTracksOutput> getArtistTopTracks(ArtistTopTracksInput input);
}
