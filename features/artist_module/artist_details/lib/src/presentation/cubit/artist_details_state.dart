part of 'artist_details_cubit.dart';

abstract class ArtistDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends ArtistDetailsState {}

class Loading extends ArtistDetailsState {}

class Empty extends ArtistDetailsState {}

class Loaded extends ArtistDetailsState {
  final ArtistDetailsEntity artistDetailsEntity;

  Loaded(this.artistDetailsEntity);
  @override
  List<Object> get props => [artistDetailsEntity];
}

class Error extends ArtistDetailsState {
  final List<String> error;

  Error(this.error);

  @override
  List<Object> get props => [error];
}
