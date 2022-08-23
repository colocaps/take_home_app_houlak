import 'package:artist_top_tracks/src/domain/entities/album_entity.dart';
import 'package:artist_top_tracks/src/domain/entities/response_entity.dart';
import 'package:artist_top_tracks/src/domain/entities/track_entity.dart';
import 'package:artist_top_tracks/src/domain/interactor/input_output/artist_top_trancks_input.dart';
import 'package:artist_top_tracks/src/domain/interactor/input_output/artist_top_trancks_output.dart';
import 'package:artist_top_tracks/src/domain/interactor/usecase/artist_top_tracks_usecase.dart';
import 'package:artist_top_tracks/src/presentation/cubit/artist_top_tracks_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockArtistTopTracksUsecase extends Mock
    implements ArtistTopTracksUsecase {}

void main() {
  MockArtistTopTracksUsecase usecase;
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

  var outputEmpty = ArtistTopTracksOutput.withData(
    responseEntity: null,
  );
  blocTest<ArtistTopTracksCubit, ArtistTopTracksState>(
    'emits [Loading, Error] when artist details cant be fetched',
    build: () {
      usecase = MockArtistTopTracksUsecase();

      when(() => usecase.execute(input)).thenAnswer(
        (_) => Future.value(
          outputError,
        ),
      );

      return ArtistTopTracksCubit(
        artistTopTracksUsecase: usecase,
      );
    },
    act: (cubit) async => await cubit.getArtistTopTracks(
      input: input,
    ),
    expect: () => [
      isA<Loading>(),
      isA<Error>().having(
        (state) => state.error,
        'Error',
        equals(
          outputError.errors,
        ),
      ),
    ],
  );

  blocTest<ArtistTopTracksCubit, ArtistTopTracksState>(
    'emits [Loading, Empty] when usecase returns an null or empty response',
    build: () {
      usecase = MockArtistTopTracksUsecase();

      when(() => usecase.execute(input)).thenAnswer(
        (_) => Future.value(
          outputEmpty,
        ),
      );

      return ArtistTopTracksCubit(
        artistTopTracksUsecase: usecase,
      );
    },
    act: (cubit) async => await cubit.getArtistTopTracks(
      input: input,
    ),
    expect: () => [
      isA<Loading>(),
      isA<Empty>(),
    ],
  );

  blocTest<ArtistTopTracksCubit, ArtistTopTracksState>(
    'emits [Loading, Error] when artist details cant be fetched',
    build: () {
      usecase = MockArtistTopTracksUsecase();

      when(() => usecase.execute(input)).thenAnswer(
        (_) => Future.value(
          outputError,
        ),
      );
      return ArtistTopTracksCubit(
        artistTopTracksUsecase: usecase,
      );
    },
    act: (cubit) async => await cubit.getArtistTopTracks(
      input: input,
    ),
    expect: () => [
      isA<Loading>(),
      isA<Error>().having(
        (state) => state.error,
        'Error',
        equals(
          outputError.errors,
        ),
      ),
    ],
  );

  blocTest<ArtistTopTracksCubit, ArtistTopTracksState>(
    'emits [Loading, Loaded] when usecase return artist details data',
    build: () {
      usecase = MockArtistTopTracksUsecase();

      when(() => usecase.execute(input)).thenAnswer(
        (_) => Future.value(
          output,
        ),
      );

      return ArtistTopTracksCubit(
        artistTopTracksUsecase: usecase,
      );
    },
    act: (cubit) async => await cubit.getArtistTopTracks(
      input: input,
    ),
    expect: () => [
      isA<Loading>(),
      isA<Loaded>().having(
        (state) => state.responseEntity,
        'Error',
        equals(
          output.responseEntity,
        ),
      ),
    ],
  );
}
