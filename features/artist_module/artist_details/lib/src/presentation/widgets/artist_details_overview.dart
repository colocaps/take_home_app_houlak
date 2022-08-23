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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Text(
              'Generos',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: artistDetailsEntity.genresList.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  const Icon(Icons.keyboard_double_arrow_right_rounded),
                  Text(
                    ' ${artistDetailsEntity.genresList[index]}',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Popularidad : ${artistDetailsEntity.popularity.toString()}',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
