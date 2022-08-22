import 'package:artist_top_tracks/src/domain/interactor/input_output/artist_top_trancks_input.dart';
import 'package:artist_top_tracks/src/presentation/cubit/artist_top_tracks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtistTopTracksComponent extends StatelessWidget {
  final ArtistTopTracksCubit _artistTopTracksCubit;
  final String _artistId;
  final String _token;
  final String _market;

  const ArtistTopTracksComponent({
    Key? key,
    required ArtistTopTracksCubit artistTopTracksCubit,
    required String artistId,
    required String token,
    required String market,
  })  : _artistTopTracksCubit = artistTopTracksCubit,
        _artistId = artistId,
        _token = token,
        _market = market,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _artistTopTracksCubit
        ..getArtistTopTracks(
          input: ArtistTopTracksInput(
            artistId: _artistId,
            token: _token,
            market: _market,
          ),
        ),
      child: BlocConsumer<ArtistTopTracksCubit, ArtistTopTracksState>(
        listener: (context, state) {},
        builder: _buildByState,
      ),
    );
  }

  Widget _buildByState(
    BuildContext context,
    ArtistTopTracksState state,
  ) {
    if (state is Loading) {
    } else if (state is Error) {
    } else if (state is Empty) {
    } else if (state is Loaded) {
      return Container(
        child: Text(
          'top tracks',
          style: Theme.of(context).textTheme.subtitle2,
        ),
      );
    }
    return Container();
  }
}
