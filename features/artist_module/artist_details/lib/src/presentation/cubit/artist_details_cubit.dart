import 'package:artist_details/src/domain/entities/artist_detail_entity.dart';
import 'package:artist_details/src/domain/interactor/input_output/artist_details_input.dart';
import 'package:artist_details/src/domain/interactor/usecase/artist_details_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'artist_details_state.dart';

class ArtistDetailsCubit extends Cubit<ArtistDetailsState> {
  final ArtistDetailsUsecase _artistDetailsUsecase;
  ArtistDetailsCubit({
    required ArtistDetailsUsecase artistDetailsUsecase,
  })  : _artistDetailsUsecase = artistDetailsUsecase,
        super(Initial());

  Future<void> getArtistDetails({
    required ArtistDetailsInput input,
  }) async {
    emit(Loading());

    var result = await _artistDetailsUsecase.execute(input);

    if (result.hasErrors) {
      emit(
        Error(
          result.errors!,
        ),
      );
    } else if (result.artistDetailsEntity == null) {
      emit(Empty());
    } else {
      emit(
        Loaded(result.artistDetailsEntity!),
      );
    }
  }
}
