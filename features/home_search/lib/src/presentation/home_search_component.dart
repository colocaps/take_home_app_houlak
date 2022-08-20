import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_search/src/domain/interactor/input_output/home_search_input.dart';
import 'package:home_search/src/presentation/cubit/home_search_cubit.dart';

class HomeSearchComponent extends StatelessWidget {
  final HomeSearchCubit _homeSearchCubit;
  const HomeSearchComponent({
    Key? key,
    required HomeSearchCubit homeSearchCubit,
  })  : _homeSearchCubit = homeSearchCubit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeSearchCubit
        ..getNowPlayingMovies(
          input: HomeSearchInput(
            query: 'remaster%20track:Doxy+artist:Miles%20Davis',
            type: ['track'],
            token:
                'BQA2urmdhIBW9ymfID6GC4dEPY9rSTWOwMKWwS_EJv0qJZ2PV4Gv4G67sUDjavyjgstXOYfebmKcgzEAazxux6hDNSKcVwbVHFO3ofc9ScUCVn-dLN3bWU9StDU22vZzJC4KuFm_lFwzW-UZyjJPEGKKnR6bES0G0gK7B7n3T3rnbhljFnMTnMqXtV74DE9KEyc',
          ),
        ),
      child: BlocConsumer<HomeSearchCubit, HomeSearchState>(
        listener: (context, state) {},
        builder: _buildByState,
      ),
    );
  }

  Widget _buildByState(
    BuildContext context,
    HomeSearchState state,
  ) {
    if (state is Loaded) {
      return Container(
        child: Text(
          state.responseEntity.trackEntity.resultsEntity.total.toString(),
        ),
      );
    } else if (state is Error) {
      return Center(
        child: Container(
          child: Text(
            state.error.first.toString(),
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    }

    return Container();
  }
}
