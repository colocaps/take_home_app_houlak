import 'package:artist_details/src/domain/entities/artist_detail_entity.dart';
import 'package:artist_details/src/domain/interactor/input_output/artist_details_input.dart';
import 'package:artist_details/src/domain/interactor/input_output/artist_details_output.dart';
import 'package:artist_details/src/domain/interactor/usecase/artist_details_usecase_impl.dart';
import 'package:artist_details/src/domain/repositories/artist_details_remote_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockArtistDetailsRemoteRepository extends Mock
    implements ArtistDetailsRemoteRepository {}

void main() {
  MockArtistDetailsRemoteRepository _repository;

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

  test('should throw an error when repository does no respond ok', () async {
    _repository = MockArtistDetailsRemoteRepository();

    when(
      () => _repository.getArtistDetails(
        input,
      ),
    ).thenAnswer(
      (_) => Future.value(
        outputError,
      ),
    );

    var usecase = ArtistDetailsUsecaseImpl(
      artistDetailsRemoteRepository: _repository,
    );

    final response = await usecase.execute(input);

    verify(
      () => _repository.getArtistDetails(
        input,
      ),
    ).called(1);

    expect(
      response.errors,
      outputError.errors,
    );
  });

  test('should return data when repository responds ok', () async {
    _repository = MockArtistDetailsRemoteRepository();

    when(
      () => _repository.getArtistDetails(
        input,
      ),
    ).thenAnswer(
      (_) => Future.value(
        output,
      ),
    );

    var usecase = ArtistDetailsUsecaseImpl(
      artistDetailsRemoteRepository: _repository,
    );

    final response = await usecase.execute(input);

    verify(() => _repository.getArtistDetails(input)).called(1);

    expect(
      response.artistDetailsEntity,
      output.artistDetailsEntity,
    );
  });
}
