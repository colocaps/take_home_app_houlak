import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInBuildInitial extends StatelessWidget {
  final void Function()? _onPressed;
  final String _titleText;
  final String _buttonText;
  const SignInBuildInitial({
    Key? key,
    required void Function()? onPressed,
    required String titleText,
    required String buttonText,
  })  : _onPressed = onPressed,
        _titleText = titleText,
        _buttonText = buttonText,
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
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.0),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 150,
          ),
          child: Text(
            _titleText,
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 550,
          ),
          alignment: Alignment.bottomCenter,
          color: Colors.grey.withOpacity(0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 240,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xff1DB954),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.0,
                          color: Theme.of(context).colorScheme.secondary,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  onPressed: _onPressed,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        _buttonText,
                        style: const TextStyle(
                          fontSize: 13.0,
                          fontFamily: "Raleway",
                        ),
                      ),
                      const Icon(FontAwesomeIcons.spotify),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "by Esteban Farias",
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
