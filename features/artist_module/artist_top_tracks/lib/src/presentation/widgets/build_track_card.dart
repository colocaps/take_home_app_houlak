import 'package:artist_top_tracks/src/domain/entities/track_entity.dart';
import 'package:flutter/material.dart';

class BuildTrackCard extends StatelessWidget {
  final TrackEntity trackEntity;

  const BuildTrackCard({
    Key? key,
    required this.trackEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 150,
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage(
                    'assets/images/No-image-available.png',
                    package: 'core',
                  ),
                  image: NetworkImage(
                    trackEntity.album.imagesList[0].url,
                  ),
                  height: 160,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.black,
                height: 10,
              ),
              Text(
                trackEntity.tackName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
