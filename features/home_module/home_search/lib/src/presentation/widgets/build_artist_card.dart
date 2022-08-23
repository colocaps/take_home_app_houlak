import 'package:flutter/material.dart';

class BuildArtistCard extends StatelessWidget {
  final String _artistName;
  final String _popularity;
  final String _imageUrl;
  const BuildArtistCard({
    Key? key,
    required String artistName,
    required String popularity,
    required String imageUrl,
  })  : _artistName = artistName,
        _popularity = popularity,
        _imageUrl = imageUrl,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.all(
        8,
      ),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shadowColor: Theme.of(context).highlightColor,
        color: Theme.of(context).backgroundColor,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(
            color: Color(0xff1DB954),
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(2), // Border width
                decoration: BoxDecoration(
                  color: const Color(0xff1DB954),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(48), // Image radius
                    child: Image.network(_imageUrl, fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      ' $_artistName',
                      style: Theme.of(context).textTheme.headline2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Popularidad: $_popularity',
                      style: Theme.of(context).textTheme.headline2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Toca para ver detalles',
                      style: Theme.of(context).textTheme.caption,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
