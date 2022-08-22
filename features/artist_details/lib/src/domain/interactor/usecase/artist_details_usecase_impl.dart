import 'package:artist_details/src/domain/interactor/input_output/artist_details_input.dart';
import 'package:artist_details/src/domain/interactor/input_output/artist_details_output.dart';
import 'package:artist_details/src/domain/interactor/usecase/artist_details_usecase.dart';
import 'package:artist_details/src/domain/repositories/artist_details_remote_repository.dart';

class ArtistDetailsUsecaseImpl implements ArtistDetailsUsecase {
  final ArtistDetailsRemoteRepository _artistDetailsRemoteRepository;
  ArtistDetailsUsecaseImpl({
    required ArtistDetailsRemoteRepository artistDetailsRemoteRepository,
  }) : _artistDetailsRemoteRepository = artistDetailsRemoteRepository;

  @override
  Future<ArtistDetailsOutput> execute(ArtistDetailsInput input) async {
    final resp = await _artistDetailsRemoteRepository.getArtistDetails(
      input,
    );

    if (resp.hasErrors) {
      return ArtistDetailsOutput.withErrors(
        errors: resp.errors,
      );
    } else {
      return ArtistDetailsOutput.withData(
        responseEntity: resp.responseEntity,
      );
    }
  }
}
