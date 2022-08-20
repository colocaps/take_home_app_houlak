import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomEmptyState extends StatelessWidget {
  final IconData? icon;
  final String titleError;
  final String subtitleError;
  final Color backgroundColor;
  final bool withIcon;
  final String? image;

  const CustomEmptyState({
    Key? key,
    this.icon,
    required this.titleError,
    required this.subtitleError,
    required this.backgroundColor,
    required this.withIcon,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        width: MediaQuery.of(context).size.width * 1,
        margin: const EdgeInsets.all(
          10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            withIcon
                ? Icon(
                    icon,
                    size: 50,
                    color: Colors.black87,
                  )
                : Image.asset(image!),
            const SizedBox(
              height: 10,
            ),
            AutoSizeText(
              titleError,
              textAlign: TextAlign.center,
              maxLines: 1,
              maxFontSize: 22,
              minFontSize: 18,
            ),
            const SizedBox(
              height: 10,
            ),
            AutoSizeText(
              subtitleError,
              textAlign: TextAlign.center,
              maxLines: 2,
              maxFontSize: 16,
              minFontSize: 10,
            ),
          ],
        ),
      ),
    );
  }
}
