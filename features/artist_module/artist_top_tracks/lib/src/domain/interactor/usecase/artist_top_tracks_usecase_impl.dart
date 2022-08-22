import 'package:artist_top_tracks/src/domain/interactor/input_output/artist_top_trancks_input.dart';
import 'package:artist_top_tracks/src/domain/interactor/input_output/artist_top_trancks_output.dart';
import 'package:artist_top_tracks/src/domain/interactor/usecase/artist_top_trancks_usecase.dart';
import 'package:artist_top_tracks/src/domain/repositories/artist_top_trancks_remote_repository.dart';

class ArtistTopTracksUsecaseImpl implements ArtistTopTracksUsecase {
  final ArtistTopTracksRemoteRepository _artistTopTracksRemoteRepository;
  ArtistTopTracksUsecaseImpl({
    required ArtistTopTracksRemoteRepository artistTopTracksRemoteRepository,
  }) : _artistTopTracksRemoteRepository = artistTopTracksRemoteRepository;

  @override
  Future<ArtistTopTracksOutput> execute(ArtistTopTracksInput input) async {
    final resp = await _artistTopTracksRemoteRepository.getArtistTopTracks(
      input,
    );

    if (resp.hasErrors) {
      return ArtistTopTracksOutput.withErrors(
        errors: resp.errors,
      );
    } else {
      return ArtistTopTracksOutput.withData(
        trackEntity: resp.trackEntity,
      );
    }
  }
}
