import 'package:core/src/abstractions/injector_container.dart';
import 'package:get_it/get_it.dart';

class GetItInjector implements InjectorContainer {
  static final GetItInjector _singleton = GetItInjector._internal();
  final GetIt _getIt = GetIt.asNewInstance();

  factory GetItInjector() {
    return _singleton;
  }

  GetItInjector._internal();

  @override
  void registerFactory<T extends Object>(factoryFunc) {
    if (_getIt.isRegistered<T>()) {
      _getIt.unregister<T>();
    }

    _getIt.registerFactory<T>(factoryFunc);
  }

  @override
  void registerFactoryByName<T extends Object>(factoryFunc, String name) {
    if (_getIt.isRegistered<T>(instanceName: name)) {
      _getIt.unregister<T>(instanceName: name);
    }
    _getIt.registerFactory<T>(
      factoryFunc,
      instanceName: name,
    );
  }

  @override
  void registerLazySingleton<T extends Object>(factoryFunc) {
    if (_getIt.isRegistered<T>()) {
      _getIt.unregister<T>();
    }

    _getIt.registerLazySingleton(factoryFunc);
  }

  @override
  T resolve<T extends Object>() {
    return _getIt.get<T>();
  }

  @override
  T resolveByName<T extends Object>(String name) {
    return _getIt.get<T>(
      instanceName: name,
    );
  }
}
