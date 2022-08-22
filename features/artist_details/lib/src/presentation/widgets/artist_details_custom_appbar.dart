import 'package:artist_details/src/domain/entities/artist_detail_entity.dart';
import 'package:flutter/material.dart';

class ArtistDetailsCustomAppbar extends StatelessWidget {
  final ArtistDetailsEntity artistDetailsEntity;

  const ArtistDetailsCustomAppbar({
    Key? key,
    required this.artistDetailsEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.blueAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          padding: const EdgeInsets.only(
            bottom: 10,
            left: 10,
            right: 10,
          ),
          color: Colors.black12,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: Text(
            artistDetailsEntity.name,
            style: const TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage(
            'assets/images/loading.gif',
            package: 'core',
          ),
          image: NetworkImage(
            artistDetailsEntity.imagesList[0].url,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
