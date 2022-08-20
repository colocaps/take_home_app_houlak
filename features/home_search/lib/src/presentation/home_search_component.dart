import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_search/src/presentation/cubit/home_search_cubit.dart';
import 'package:home_search/src/presentation/widgets/build_artist_card.dart';

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
    var size = MediaQuery.of(context).size;
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
    } else if (state is Loading) {
      return Image.asset(
        'assets/images/loading.gif',
        package: 'core',
        fit: BoxFit.contain,
        width: size.width,
        height: size.width / 2.618,
      );
    } else if (state is Loaded) {
      var itemEntityList = state.responseEntity.artistEntity.itemEntityList;
      return ListView.builder(
        itemCount: itemEntityList.length,
        itemBuilder: (BuildContext context, int index) {
          return BuildArtistCard(
            artistName: itemEntityList[index].name,
            popularity: itemEntityList[index].popularity.toString(),
            imageUrl: itemEntityList[index].imagesEntity.isEmpty
                ? 'https://st.depositphotos.com/1987177/3470/v/450/depositphotos_34700099-stock-illustration-no-photo-available-or-missing.jpg'
                : itemEntityList[index].imagesEntity[0].url,
          );
        },
      );
    } else if (state is Error) {
      return Center(
        child: Container(
          child: Text(
            state.error.first.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return Container();
  }
}
