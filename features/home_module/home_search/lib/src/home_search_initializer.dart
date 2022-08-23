import 'package:core/core.dart';
import 'package:home_search/src/data/home_search_remote_repository_impl.dart';
import 'package:home_search/src/domain/interactor/usecase/home_search_usecase.dart';
import 'package:home_search/src/domain/interactor/usecase/home_search_usecase_impl.dart';
import 'package:home_search/src/domain/repositories/home_search_remote_repository.dart';
import 'package:home_search/src/presentation/cubit/home_search_cubit.dart';

abstract class HomeSearhcInitializer {
  static registerDependencies() {
    var injector = InjectorContainer.instance;

    injector.registerFactory<HomeSearchUsecase>(
      () => HomeSearchUsecaseImpl(
        homeSearchRemoteRepository:
            injector.resolve<HomeSearchRemoteRepository>(),
      ),
    );

    injector.registerFactory<DioManager>(
      () => DioManagerImpl(),
    );

    injector.registerFactory(
      () => HomeSearchCubit(
        homeSearchUsecase: injector.resolve<HomeSearchUsecase>(),
      ),
    );

    injector.registerFactory<HomeSearchRemoteRepository>(
      () => HomeSearchRemoteRepositoryImpl(
        baseUrl: injector.resolveByName('baseUrl'),
        dioManager: injector.resolve<DioManager>(),
      ),
    );
  }
}
