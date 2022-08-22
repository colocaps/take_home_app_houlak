part of 'artist_top_tracks_cubit.dart';

abstract class ArtistTopTracksState extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends ArtistTopTracksState {}

class Loading extends ArtistTopTracksState {}

class Empty extends ArtistTopTracksState {}

class Loaded extends ArtistTopTracksState {
  final TrackEntity trackEntity;

  Loaded(this.trackEntity);
  @override
  List<Object> get props => [trackEntity];
}

class Error extends ArtistTopTracksState {
  final List<String> error;

  Error(this.error);

  @override
  List<Object> get props => [error];
}
