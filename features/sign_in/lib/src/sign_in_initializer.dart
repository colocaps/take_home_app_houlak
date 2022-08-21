import 'package:core/core.dart';
import 'package:sign_in/sign_in.dart';
import 'package:sign_in/src/data/sign_in_remote_repository_impl.dart';
import 'package:sign_in/src/domain/interactor/usecase/sign_in_usecase.dart';
import 'package:sign_in/src/domain/interactor/usecase/sign_in_usecase_impl.dart';
import 'package:sign_in/src/domain/repositories/sign_in_remote_repository.dart';

abstract class SignInInitializer {
  static registerDependencies() {
    var injector = InjectorContainer.instance;

    injector.registerFactory<SignInUsecase>(
      () => SignInUsecaseImpl(
        signInRepository: injector.resolve<SignInRepository>(),
      ),
    );

    injector.registerFactory(
      () => SignInCubit(
        signInUsecase: injector.resolve<SignInUsecase>(),
      ),
    );

    injector.registerFactory<SignInRepository>(
      () => SignInRemoteRepositoryImpl(),
    );
  }
}
