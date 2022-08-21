import 'package:home_search/src/domain/interactor/input_output/home_search_input.dart';
import 'package:home_search/src/domain/interactor/input_output/home_search_output.dart';

abstract class HomeSearchUsecase {
  Future<HomeSearchOutput> execute(HomeSearchInput input);
}
