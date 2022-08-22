part of 'artist_top_tracks_cubit.dart';

abstract class ArtistTopTracksState extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends ArtistTopTracksState {}

class Loading extends ArtistTopTracksState {}

class Empty extends ArtistTopTracksState {}

class Loaded extends ArtistTopTracksState {
  final ResponseEntity responseEntity;

  Loaded(this.responseEntity);
  @override
  List<Object> get props => [responseEntity];
}

class Error extends ArtistTopTracksState {
  final List<String> error;

  Error(this.error);

  @override
  List<Object> get props => [error];
}
