import 'package:home_search/src/domain/interactor/input_output/home_search_input.dart';
import 'package:home_search/src/domain/interactor/input_output/home_search_output.dart';
import 'package:home_search/src/domain/interactor/usecase/home_search_usecase.dart';
import 'package:home_search/src/domain/repositories/home_search_remote_repository.dart';

class HomeSearchUsecaseImpl implements HomeSearchUsecase {
  final HomeSearchRemoteRepository _homeSearchRemoteRepository;
  HomeSearchUsecaseImpl({
    required HomeSearchRemoteRepository homeSearchRemoteRepository,
  }) : _homeSearchRemoteRepository = homeSearchRemoteRepository;

  @override
  Future<HomeSearchOutput> execute(HomeSearchInput input) async {
    final resp = await _homeSearchRemoteRepository.getHomeSearchResponse(input);

    if (resp.hasErrors) {
      return HomeSearchOutput.withErrors(
        errors: resp.errors,
      );
    } else {
      return HomeSearchOutput.withData(
        responseEntity: resp.responseEntity,
      );
    }
  }
}
