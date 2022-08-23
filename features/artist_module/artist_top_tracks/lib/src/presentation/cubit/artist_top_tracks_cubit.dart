import 'package:artist_top_tracks/src/domain/entities/response_entity.dart';
import 'package:artist_top_tracks/src/domain/interactor/input_output/artist_top_trancks_input.dart';
import 'package:artist_top_tracks/src/domain/interactor/usecase/artist_top_tracks_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'artist_top_tracks_state.dart';

class ArtistTopTracksCubit extends Cubit<ArtistTopTracksState> {
  final ArtistTopTracksUsecase _artistTopTracksUsecase;
  ArtistTopTracksCubit({
    required ArtistTopTracksUsecase artistTopTracksUsecase,
  })  : _artistTopTracksUsecase = artistTopTracksUsecase,
        super(Initial());

  Future<void> getArtistTopTracks({
    required ArtistTopTracksInput input,
  }) async {
    emit(Loading());

    var result = await _artistTopTracksUsecase.execute(input);

    if (result.hasErrors) {
      emit(
        Error(
          result.errors!,
        ),
      );
    } else if (result.responseEntity == null) {
      emit(Empty());
    } else {
      emit(
        Loaded(result.responseEntity!),
      );
    }
  }
}
