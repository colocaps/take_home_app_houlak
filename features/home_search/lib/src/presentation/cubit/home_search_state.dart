part of 'home_search_cubit.dart';

abstract class HomeSearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends HomeSearchState {}

class Loading extends HomeSearchState {}

class Empty extends HomeSearchState {}

class Loaded extends HomeSearchState {
  final ArtistEntity artistEntity;

  Loaded(this.artistEntity);
  @override
  List<Object> get props => [artistEntity];
}

class Error extends HomeSearchState {
  final List<String> error;

  Error(this.error);

  @override
  List<Object> get props => [error];
}
