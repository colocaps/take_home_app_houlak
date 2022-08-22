class AuthorizationEntity {
  final String accessToken;
  final String expiresIn;

  AuthorizationEntity({
    required this.accessToken,
    required this.expiresIn,
  });
}
