import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_search/src/domain/entities/artist_entity.dart';
import 'package:home_search/src/domain/entities/response_entity.dart';
import 'package:home_search/src/domain/interactor/input_output/home_search_input.dart';
import 'package:home_search/src/domain/interactor/usecase/home_search_usecase.dart';

part 'home_search_state.dart';

class HomeSearchCubit extends Cubit<HomeSearchState> {
  final HomeSearchUsecase _homeSearchUsecase;
  HomeSearchCubit({
    required HomeSearchUsecase homeSearchUsecase,
  })  : _homeSearchUsecase = homeSearchUsecase,
        super(Initial());

  Future<void> getSearchResult({
    required HomeSearchInput input,
  }) async {
    emit(Loading());

    var result = await _homeSearchUsecase.execute(input);

    if (result.hasErrors) {
      emit(
        Error(
          result.errors!,
        ),
      );
    } else {
      emit(
        Loaded(result.responseEntity!),
      );
    }
  }
}
