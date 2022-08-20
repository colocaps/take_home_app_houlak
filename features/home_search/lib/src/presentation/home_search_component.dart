import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      value: _homeSearchCubit,
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
    if (state is Initial) {
      return const Center(
        child: CustomEmptyState(
          backgroundColor: Colors.white,
          subtitle: 'El buscador de artistas de Spotify',
          title: 'Bienvenido a',
          withIcon: false,
          image: 'assets/images/spotify-music.gif',
        ),
      );
    }
    if (state is Loaded) {
      return Center(
        child: Container(
          child: Column(
            children: [
              Text(
                state.artistEntity.total.toString(),
                style: TextStyle(color: Colors.white),
              ),
              Text('' // state.artistEntity.itemEntityList[0].name,
                  ),
            ],
          ),
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
