import 'package:artist_details/src/data/repositories/artist_details_remote_repository_impl.dart';
import 'package:artist_details/src/domain/interactor/usecase/artist_details_usecase.dart';
import 'package:artist_details/src/domain/interactor/usecase/artist_details_usecase_impl.dart';
import 'package:artist_details/src/domain/repositories/artist_details_remote_repository.dart';
import 'package:artist_details/src/presentation/cubit/artist_details_cubit.dart';
import 'package:core/core.dart';

abstract class ArtistDetailsInitializer {
  static registerDependencies() {
    var injector = InjectorContainer.instance;

    injector.registerFactory<ArtistDetailsUsecase>(
      () => ArtistDetailsUsecaseImpl(
        artistDetailsRemoteRepository:
            injector.resolve<ArtistDetailsRemoteRepository>(),
      ),
    );

    injector.registerFactory<DioManager>(
      () => DioManagerImpl(),
    );

    injector.registerFactory(
      () => ArtistDetailsCubit(
        artistDetailsUsecase: injector.resolve<ArtistDetailsUsecase>(),
      ),
    );

    injector.registerFactory<ArtistDetailsRemoteRepository>(
      () => ArtistDetailsRemoteRepositoryImpl(
        baseUrl: injector.resolveByName('baseUrl'),
        dioManager: injector.resolve<DioManager>(),
      ),
    );
  }
}
