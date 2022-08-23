import 'package:artist_top_tracks/src/domain/interactor/input_output/artist_top_trancks_input.dart';
import 'package:artist_top_tracks/src/presentation/cubit/artist_top_tracks_cubit.dart';
import 'package:artist_top_tracks/src/presentation/widgets/artist_top_tracks_build_loaded.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtistTopTracksComponent extends StatelessWidget {
  final ArtistTopTracksCubit _artistTopTracksCubit;
  final String _artistId;
  final String _token;
  final String _market;
  final AudioManager _audioManager;
  const ArtistTopTracksComponent({
    Key? key,
    required ArtistTopTracksCubit artistTopTracksCubit,
    required String artistId,
    required String token,
    required String market,
    required AudioManager audioManager,
  })  : _artistTopTracksCubit = artistTopTracksCubit,
        _artistId = artistId,
        _token = token,
        _market = market,
        _audioManager = audioManager,
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
    var size = MediaQuery.of(context).size;
    if (state is Loading) {
      return Image.asset(
        'assets/images/loading.gif',
        package: 'core',
        fit: BoxFit.contain,
        width: size.width,
        height: size.width / 2.618,
      );
    } else if (state is Error) {
      return Center(
        child: Text(
          state.error.first.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      );
    } else if (state is Empty) {
    } else if (state is Loaded) {
      return ArtistTopTracksBuildLoaded(
        audioManager: _audioManager,
        trackEntity: state.responseEntity.trackEntity,
      );
    }
    return Container();
  }
}
