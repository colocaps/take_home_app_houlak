import 'package:artist_top_tracks/src/domain/entities/track_entity.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class BuildTrackCard extends StatelessWidget {
  final TrackEntity trackEntity;
  final AudioManager _audioManager;
  const BuildTrackCard({
    Key? key,
    required this.trackEntity,
    required AudioManager audioManager,
  })  : _audioManager = audioManager,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 320,
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
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _audioManager.setUrl(trackEntity.previewUrl);
                      _audioManager.play();
                    },
                    child: Icon(Icons.play_arrow),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _audioManager.pause();
                    },
                    child: Icon(Icons.pause),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
