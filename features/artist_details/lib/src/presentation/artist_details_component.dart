import 'package:artist_details/src/domain/interactor/input_output/artist_details_input.dart';
import 'package:artist_details/src/presentation/cubit/artist_details_cubit.dart';
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
      child: Container(),
    );
  }
}
