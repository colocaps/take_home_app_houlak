import 'package:artist_details/src/domain/interactor/input_output/artist_details_input.dart';
import 'package:artist_details/src/domain/interactor/input_output/artist_details_output.dart';

abstract class ArtistDetailsUsecase {
  Future<ArtistDetailsOutput> execute(ArtistDetailsInput input);
}
