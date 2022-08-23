import 'package:artist_details/src/domain/entities/artist_detail_entity.dart';
import 'package:artist_details/src/domain/interactor/input_output/artist_details_input.dart';
import 'package:artist_details/src/domain/interactor/input_output/artist_details_output.dart';
import 'package:artist_details/src/domain/interactor/usecase/artist_details_usecase.dart';
import 'package:artist_details/src/presentation/cubit/artist_details_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockArtistDetailsUsecase extends Mock implements ArtistDetailsUsecase {}

void main() {
  MockArtistDetailsUsecase usecase;

  var input = ArtistDetailsInput(
    artistId: '454',
    token: 'asdasdasd',
  );
  var artistDetailEntity = ArtistDetailsEntity(
    href: '454',
    genresList: ['as'],
    id: 'asd',
    imagesList: [],
    name: 'name',
    popularity: 12,
  );
  var outputError = ArtistDetailsOutput.withErrors(
    errors: ['error'],
  );
  var output = ArtistDetailsOutput.withData(
    artistDetailsEntity: artistDetailEntity,
  );
  var outputEmpty = ArtistDetailsOutput.withData(
    artistDetailsEntity: null,
  );
  blocTest<ArtistDetailsCubit, ArtistDetailsState>(
    'emits [Loading, Error] when artist details cant be fetched',
    build: () {
      usecase = MockArtistDetailsUsecase();

      when(() => usecase.execute(input)).thenAnswer(
        (_) => Future.value(
          outputError,
        ),
      );

      return ArtistDetailsCubit(
        artistDetailsUsecase: usecase,
      );
    },
    act: (cubit) async => await cubit.getArtistDetails(
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

  blocTest<ArtistDetailsCubit, ArtistDetailsState>(
    'emits [Loading, Empty] when usecase returns an null or empty response',
    build: () {
      usecase = MockArtistDetailsUsecase();

      when(() => usecase.execute(input)).thenAnswer(
        (_) => Future.value(
          outputEmpty,
        ),
      );

      return ArtistDetailsCubit(
        artistDetailsUsecase: usecase,
      );
    },
    act: (cubit) async => await cubit.getArtistDetails(
      input: input,
    ),
    expect: () => [
      isA<Loading>(),
      isA<Empty>(),
    ],
  );

  blocTest<ArtistDetailsCubit, ArtistDetailsState>(
    'emits [Loading, Error] when artist details cant be fetched',
    build: () {
      usecase = MockArtistDetailsUsecase();

      when(() => usecase.execute(input)).thenAnswer(
        (_) => Future.value(
          outputError,
        ),
      );

      return ArtistDetailsCubit(
        artistDetailsUsecase: usecase,
      );
    },
    act: (cubit) async => await cubit.getArtistDetails(
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
  blocTest<ArtistDetailsCubit, ArtistDetailsState>(
    'emits [Loading, Loaded] when usecase return artist details data',
    build: () {
      usecase = MockArtistDetailsUsecase();

      when(() => usecase.execute(input)).thenAnswer(
        (_) => Future.value(
          output,
        ),
      );

      return ArtistDetailsCubit(
        artistDetailsUsecase: usecase,
      );
    },
    act: (cubit) async => await cubit.getArtistDetails(
      input: input,
    ),
    expect: () => [
      isA<Loading>(),
      isA<Loaded>().having(
        (state) => state.artistDetailsEntity,
        'Error',
        equals(
          output.artistDetailsEntity,
        ),
      ),
    ],
  );
}
