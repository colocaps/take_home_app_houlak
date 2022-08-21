abstract class EnvironmentConfig {
  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: '...',
  );

  static const clientID = String.fromEnvironment(
    'CLIENT_ID',
    defaultValue: '...',
  );

  static const redirectUri = String.fromEnvironment(
    'REDIRECT_URI',
    defaultValue: '...',
  );
  static const callbackScheme = String.fromEnvironment(
    'CALLBACK_SCHEME',
    defaultValue: '...',
  );
}
