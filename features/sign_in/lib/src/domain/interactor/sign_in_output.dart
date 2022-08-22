import 'package:sign_in/src/domain/entities/authorization_entity.dart';

class SignInOutput {
  final AuthorizationEntity? authorizationEntity;
  late List<String>? errors = [];

  SignInOutput.withData({
    required this.authorizationEntity,
  });

  SignInOutput.withErrors({
    required this.errors,
    this.authorizationEntity,
  });

  bool get hasErrors => errors?.isNotEmpty ?? false;
}
