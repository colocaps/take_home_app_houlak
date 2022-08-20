part of 'home_search_cubit.dart';

abstract class HomeSearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends HomeSearchState {}

class Loading extends HomeSearchState {}

class Empty extends HomeSearchState {}

class Loaded extends HomeSearchState {
  final ResponseEntity responseEntity;

  Loaded(this.responseEntity);
  @override
  List<Object> get props => [responseEntity];
}

class Error extends HomeSearchState {
  final List<String> error;

  Error(this.error);

  @override
  List<Object> get props => [error];
}
