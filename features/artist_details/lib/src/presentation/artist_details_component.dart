import 'package:artist_details/src/domain/interactor/input_output/artist_details_input.dart';
import 'package:artist_details/src/presentation/cubit/artist_details_cubit.dart';
import 'package:artist_details/src/presentation/widgets/artist_details_build_loaded.dart';
import 'package:core/widgets/custom_empty_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtistDetailsComponent extends StatelessWidget {
  final ArtistDetailsCubit _artistDetailsCubit;
  final String _artistId;
  final String _token;

  const ArtistDetailsComponent({
    Key? key,
    required ArtistDetailsCubit artistDetailsCubit,
    required String artistId,
    required String token,
  })  : _artistDetailsCubit = artistDetailsCubit,
        _artistId = artistId,
        _token = token,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _artistDetailsCubit
        ..getArtistDetails(
          input: ArtistDetailsInput(
            artistId: _artistId,
            token: _token,
          ),
        ),
      child: BlocConsumer<ArtistDetailsCubit, ArtistDetailsState>(
        listener: (context, state) {},
        builder: _buildByState,
      ),
    );
  }

  Widget _buildByState(
    BuildContext context,
    ArtistDetailsState state,
  ) {
    var size = MediaQuery.of(context).size;
    if (state is Empty) {
      return Center(
        child: CustomEmptyState(
          backgroundColor: Theme.of(context).backgroundColor,
          subtitle: 'que estas buscando no fue encontrado',
          title: 'El artista',
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
    } else if (state is Error) {
      return Center(
        child: CustomEmptyState(
          backgroundColor: Theme.of(context).backgroundColor,
          subtitle: 'intente de nuevo mas tarde',
          title: 'Hubo un problema',
          withIcon: false,
          image: 'assets/images/spotify-music.gif',
        ),
      );
    } else if (state is Loaded) {
      return ArtistDetailsBuildLoaded(
        artistDetailsEntity: state.responseEntity.artistDetailsEntity,
      );
    }
    return Container();
  }
}
