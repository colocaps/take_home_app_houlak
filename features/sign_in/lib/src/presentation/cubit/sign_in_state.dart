part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends SignInState {}

class Loading extends SignInState {}

class Empty extends SignInState {}

class Loaded extends SignInState {
  final AuthorizationEntity authorizationEntity;

  Loaded(this.authorizationEntity);
  @override
  List<Object> get props => [authorizationEntity];
}

class Error extends SignInState {
  final List<String> error;

  Error(this.error);

  @override
  List<Object> get props => [error];
}
