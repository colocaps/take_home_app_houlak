import 'package:artist_top_tracks/src/presentation/cubit/artist_top_tracks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtistTopTracksComponent extends StatelessWidget {
  final ArtistTopTracksCubit _artistTopTracksCubit;

  const ArtistTopTracksComponent({
    Key? key,
    required ArtistTopTracksCubit artistTopTracksCubit,
  })  : _artistTopTracksCubit = artistTopTracksCubit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _artistTopTracksCubit,
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
    } else if (state is Loaded) {}
    return Container();
  }
}
