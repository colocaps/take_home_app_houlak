typedef FactoryFunc<T> = T Function();

abstract class InjectorContainer {
  static late InjectorContainer instance;

  void registerFactory<T extends Object>(FactoryFunc<T> factoryFunc);

  void registerFactoryByName<T extends Object>(
      FactoryFunc<T> factoryFunc, String name);

  void registerLazySingleton<T extends Object>(FactoryFunc<T> factoryFunc);

  T resolve<T extends Object>();

  T resolveByName<T extends Object>(String name);

  static InjectorContainer register(InjectorContainer implementation) {
    instance = implementation;

    return instance;
  }
}
