import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in/src/domain/entities/authorization_entity.dart';
import 'package:sign_in/src/domain/interactor/sing_in_input.dart';
import 'package:sign_in/src/domain/interactor/usecase/sign_in_usecase.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUsecase _signInUsecase;
  SignInCubit({
    required SignInUsecase signInUsecase,
  })  : _signInUsecase = signInUsecase,
        super(Initial());

  Future<void> getToken({
    required SignInInput input,
  }) async {
    emit(Loading());

    var result = await _signInUsecase.execute(input);

    if (result.hasErrors) {
      emit(
        Error(
          result.errors!,
        ),
      );
    } else {
      emit(
        Loaded(result.authorizationEntity!),
      );
    }
  }

  Future<void> initState() async {
    emit(Initial());
  }
}
