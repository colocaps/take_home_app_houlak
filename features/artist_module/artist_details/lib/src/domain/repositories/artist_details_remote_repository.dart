import 'package:artist_details/src/domain/interactor/input_output/artist_details_input.dart';
import 'package:artist_details/src/domain/interactor/input_output/artist_details_output.dart';

abstract class ArtistDetailsRemoteRepository {
  Future<ArtistDetailsOutput> getArtistDetails(
    ArtistDetailsInput input,
  );
}
