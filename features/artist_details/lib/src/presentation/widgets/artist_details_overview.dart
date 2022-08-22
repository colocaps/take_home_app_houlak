import 'package:artist_details/src/domain/entities/artist_detail_entity.dart';
import 'package:flutter/material.dart';

class ArtisDetailsOverview extends StatelessWidget {
  final ArtistDetailsEntity artistDetailsEntity;

  const ArtisDetailsOverview({
    Key? key,
    required this.artistDetailsEntity,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 10,
      ),
      child: Column(
        children: [
          Text(
            'Generos : ${artistDetailsEntity.genresList.toString()}',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            'Popularidad : ${artistDetailsEntity.popularity.toString()}',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
