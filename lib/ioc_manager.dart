import 'package:core/core.dart';

abstract class IoCManager {
  static late InjectorContainer injector;
  static void registerDependencies() {
    injector = InjectorContainer.register(GetItInjector());
    injector.registerLazySingleton<NavigationManager>(
      () => NavigationManagerImpl(),
    );
  }
}
