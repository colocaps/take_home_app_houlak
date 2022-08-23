import 'package:sign_in/src/domain/interactor/sign_in_output.dart';
import 'package:sign_in/src/domain/interactor/sing_in_input.dart';

abstract class SignInUsecase {
  Future<SignInOutput> execute(SignInInput input);
}
