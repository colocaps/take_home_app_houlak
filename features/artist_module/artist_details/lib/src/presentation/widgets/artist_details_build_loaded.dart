import 'package:artist_details/src/domain/entities/artist_detail_entity.dart';
import 'package:artist_details/src/presentation/widgets/artist_details_custom_appbar.dart';
import 'package:artist_details/src/presentation/widgets/artist_details_overview.dart';
import 'package:flutter/material.dart';

class ArtistDetailsBuildLoaded extends StatelessWidget {
  final ArtistDetailsEntity _artistDetailsEntity;
  final Widget _artistTopTracksComponent;
  const ArtistDetailsBuildLoaded({
    Key? key,
    required ArtistDetailsEntity artistDetailsEntity,
    required Widget artistTopTracksComponent,
  })  : _artistDetailsEntity = artistDetailsEntity,
        _artistTopTracksComponent = artistTopTracksComponent,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        ArtistDetailsCustomAppbar(
          artistDetailsEntity: _artistDetailsEntity,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ArtisDetailsOverview(
              artistDetailsEntity: _artistDetailsEntity,
            ),
            _artistTopTracksComponent,
          ]),
        ),
      ],
    );
  }
}
