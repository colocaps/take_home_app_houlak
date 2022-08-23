import 'package:artist_top_tracks/src/domain/interactor/input_output/artist_top_trancks_input.dart';
import 'package:artist_top_tracks/src/presentation/cubit/artist_top_tracks_cubit.dart';
import 'package:artist_top_tracks/src/presentation/widgets/build_track_card.dart';
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
    if (state is Loading) {
    } else if (state is Error) {
    } else if (state is Empty) {
    } else if (state is Loaded) {
      return Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Top 5 tracks',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 340,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (_, int index) {
                    return BuildTrackCard(
                      trackEntity: state.responseEntity.trackEntity[index],
                      audioManager: _audioManager,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}
