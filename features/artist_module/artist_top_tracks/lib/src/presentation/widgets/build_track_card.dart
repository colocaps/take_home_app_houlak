import 'package:artist_top_tracks/src/domain/entities/track_entity.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class BuildTrackCard extends StatefulWidget {
  final TrackEntity trackEntity;
  final AudioManager _audioManager;
  const BuildTrackCard({
    Key? key,
    required this.trackEntity,
    required AudioManager audioManager,
  })  : _audioManager = audioManager,
        super(key: key);

  @override
  State<BuildTrackCard> createState() => _BuildTrackCardState();
}

class _BuildTrackCardState extends State<BuildTrackCard> {
  late bool _isPlaying;
  @override
  void initState() {
    _isPlaying = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 380,
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
                    widget.trackEntity.album.imagesList[0].url,
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
                widget.trackEntity.tackName,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () async {
                      loadTrack();
                      _isPlaying
                          ? widget._audioManager.stop()
                          : widget._audioManager.play();

                      setState(() {
                        _isPlaying = !_isPlaying;
                      });
                    },
                    icon: _isPlaying
                        ? const Icon(Icons.stop)
                        : const Icon(Icons.play_arrow),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadTrack() {
    widget._audioManager.setUrl(widget.trackEntity.previewUrl);
  }
}
