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
            query: 'duki',
            type: ['track'],
            token:
                'BQB1iGZnamkmRGajk8iG9QKJjEeYqSNU2GXmB1m0dHyx9UgsaBOFfb_sgngUP3XJ4cnnoK3sFskcgfPQYuXdvEUfDLWLz01kDdA0_LErQbLOWepE_Q-LyPkaXVkv2KolfKaeTGQZcxfaa9D5X2vVPQjDtxQgbFuvXkRenNsZzYdMpTDDtQf_2ep2AnM2PiauzGU',
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
          state.responseEntity.trackEntity!.resultsEntity.total.toString(),
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
