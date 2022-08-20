abstract class EnvironmentConfig {
  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: '...',
  );

  static const clientID = String.fromEnvironment(
    'CLIENT_ID',
    defaultValue: '...',
  );
}
