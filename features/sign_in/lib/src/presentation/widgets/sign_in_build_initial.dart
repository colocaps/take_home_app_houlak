import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInBuildInitial extends StatelessWidget {
  final void Function()? _onPressed;
  const SignInBuildInitial({
    Key? key,
    required void Function()? onPressed,
  })  : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        ),
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(
                "assets/images/spotify-music.gif",
                package: 'core',
              ),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.grey.withOpacity(0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Spotify Searcher",
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 180,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.secondary,
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.0,
                            color: Theme.of(context).colorScheme.secondary,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  onPressed: _onPressed,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Sign In with Spotify",
                        style: TextStyle(
                          fontSize: 11.0,
                          fontFamily: "Raleway",
                        ),
                      ),
                      Icon(FontAwesomeIcons.spotify),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
