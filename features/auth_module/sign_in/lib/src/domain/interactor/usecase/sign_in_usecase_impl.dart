import 'package:sign_in/src/domain/interactor/sign_in_output.dart';
import 'package:sign_in/src/domain/interactor/sing_in_input.dart';
import 'package:sign_in/src/domain/interactor/usecase/sign_in_usecase.dart';
import 'package:sign_in/src/domain/repositories/sign_in_remote_repository.dart';

class SignInUsecaseImpl implements SignInUsecase {
  final SignInRepository _signInRepository;
  SignInUsecaseImpl({
    required SignInRepository signInRepository,
  }) : _signInRepository = signInRepository;

  @override
  Future<SignInOutput> execute(SignInInput input) async {
    final resp = await _signInRepository.signIn(input);

    if (resp.hasErrors) {
      return SignInOutput.withErrors(
        errors: resp.errors,
      );
    } else {
      return SignInOutput.withData(
        authorizationEntity: resp.authorizationEntity,
      );
    }
  }
}
