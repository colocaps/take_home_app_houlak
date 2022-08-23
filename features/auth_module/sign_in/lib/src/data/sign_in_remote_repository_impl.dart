import 'package:sign_in/src/domain/entities/authorization_entity.dart';
import 'package:sign_in/src/domain/interactor/sing_in_input.dart';
import 'package:sign_in/src/domain/interactor/sign_in_output.dart';
import 'package:sign_in/src/domain/repositories/sign_in_remote_repository.dart';

class SignInRemoteRepositoryImpl implements SignInRepository {
  @override
  Future<SignInOutput> signIn(SignInInput input) async {
    final response = input.authResponse;

    String at = response.fragment;
    at = "http://website/index.html?$at";
    var accesstoken = Uri.parse(at).queryParameters['access_token'];
    var expiresIn = Uri.parse(at).queryParameters['expires_in'];
    var error = response.queryParameters['error'];

    if (error != null) {
      return SignInOutput.withErrors(
        errors: [error],
      );
    } else {
      return SignInOutput.withData(
        authorizationEntity: AuthorizationEntity(
          accessToken: accesstoken!,
          expiresIn: expiresIn!,
        ),
      );
    }
  }
}
