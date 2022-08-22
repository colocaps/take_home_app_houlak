import 'package:artist_top_tracks/src/data/repositories/artist_top_tracks_remote_repository_impl.dart';
import 'package:artist_top_tracks/src/domain/interactor/usecase/artist_top_tracks_usecase.dart';
import 'package:artist_top_tracks/src/domain/interactor/usecase/artist_top_tracks_usecase_impl.dart';
import 'package:artist_top_tracks/src/domain/repositories/artist_top_tracks_remote_repository.dart';
import 'package:artist_top_tracks/src/presentation/cubit/artist_top_tracks_cubit.dart';
import 'package:core/core.dart';

abstract class ArtistTopTracksInitializer {
  static registerDependencies() {
    var injector = InjectorContainer.instance;

    injector.registerFactory<ArtistTopTracksUsecase>(
      () => ArtistTopTracksUsecaseImpl(
        artistTopTracksRemoteRepository:
            injector.resolve<ArtistTopTracksRemoteRepository>(),
      ),
    );

    injector.registerFactory<DioManager>(
      () => DioManagerImpl(),
    );

    injector.registerFactory(
      () => ArtistTopTracksCubit(
        artistTopTracksUsecase: injector.resolve<ArtistTopTracksUsecase>(),
      ),
    );

    injector.registerFactory<ArtistTopTracksRemoteRepository>(
      () => ArtistTopTracksRemoteRepositoryImpl(
        baseUrl: injector.resolveByName('baseUrl'),
        dioManager: injector.resolve<DioManager>(),
      ),
    );
  }
}
