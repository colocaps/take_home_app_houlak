import 'package:sign_in/src/domain/interactor/sign_in_output.dart';
import 'package:sign_in/src/domain/interactor/sing_in_input.dart';

abstract class SignInRepository {
  Future<SignInOutput> signIn(SignInInput input);
}
