import 'package:artist_top_tracks/src/domain/entities/album_entity.dart';
import 'package:artist_top_tracks/src/domain/entities/response_entity.dart';
import 'package:artist_top_tracks/src/domain/entities/track_entity.dart';
import 'package:artist_top_tracks/src/domain/interactor/input_output/artist_top_trancks_input.dart';
import 'package:artist_top_tracks/src/domain/interactor/input_output/artist_top_trancks_output.dart';
import 'package:artist_top_tracks/src/domain/interactor/usecase/artist_top_tracks_usecase_impl.dart';
import 'package:artist_top_tracks/src/domain/repositories/artist_top_tracks_remote_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MocjArtistTopTracksRemoteRepository extends Mock
    implements ArtistTopTracksRemoteRepository {}

void main() {
  MocjArtistTopTracksRemoteRepository repository;

  var input = ArtistTopTracksInput(
    artistId: '121',
    market: 'es',
    token: 'asdasdasd',
  );
  var trackEntity = TrackEntity(
    album: AlbumEntity(
        albumId: 'albumId',
        imagesList: [],
        artistList: [],
        albumName: 'albumName',
        releaseDate: 'releaseDate',
        totalTracks: 10),
    artistList: [],
    previewUrl: 'asdasd',
    tackName: '123',
    trackId: '123',
    trackPopularity: 12,
  );
  var responseEntity = ResponseEntity(
    trackEntity: [trackEntity],
  );

  var outputError = ArtistTopTracksOutput.withErrors(
    errors: ['errors'],
  );
  var output = ArtistTopTracksOutput.withData(
    responseEntity: responseEntity,
  );

  test('should throw an error when repository does not respond ok', () async {
    repository = MocjArtistTopTracksRemoteRepository();

    when(
      () => repository.getArtistTopTracks(
        input,
      ),
    ).thenAnswer(
      (_) => Future.value(
        outputError,
      ),
    );

    var usecase = ArtistTopTracksUsecaseImpl(
      artistTopTracksRemoteRepository: repository,
    );

    final response = await usecase.execute(input);

    verify(
      () => repository.getArtistTopTracks(
        input,
      ),
    ).called(1);

    expect(
      response.errors,
      outputError.errors,
    );
  });
  test('should return data when repository responds ok', () async {
    repository = MocjArtistTopTracksRemoteRepository();

    when(
      () => repository.getArtistTopTracks(
        input,
      ),
    ).thenAnswer(
      (_) => Future.value(
        output,
      ),
    );

    var usecase = ArtistTopTracksUsecaseImpl(
      artistTopTracksRemoteRepository: repository,
    );

    final response = await usecase.execute(input);

    verify(() => repository.getArtistTopTracks(input)).called(1);

    expect(
      response.responseEntity,
      output.responseEntity,
    );
  });
}
