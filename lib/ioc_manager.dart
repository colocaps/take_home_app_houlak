import 'package:core/core.dart';
import 'package:houlak_take_home_app/environment_config.dart';

abstract class IoCManager {
  static late InjectorContainer injector;
  static void registerDependencies() {
    injector = InjectorContainer.register(GetItInjector());
    injector.registerLazySingleton<NavigationManager>(
      () => NavigationManagerImpl(),
    );

    injector.registerLazySingleton<WebAuth>(
      () => WebAuthImpl(
        clientId: injector.resolveByName('clientID'),
        redirectUri: injector.resolveByName('redirectUri'),
        callbackScheme: injector.resolveByName('callbackScheme'),
      ),
    );

    injector.registerFactoryByName(
      () => EnvironmentConfig.baseUrl,
      'baseUrl',
    );
    injector.registerFactoryByName(
      () => EnvironmentConfig.clientID,
      'clientID',
    );

    injector.registerFactoryByName(
      () => EnvironmentConfig.redirectUri,
      'redirectUri',
    );

    injector.registerFactoryByName(
      () => EnvironmentConfig.callbackScheme,
      'callbackScheme',
    );
  }
}
