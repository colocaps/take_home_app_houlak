import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomEmptyState extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final bool withIcon;
  final String? image;

  const CustomEmptyState({
    Key? key,
    this.icon,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.withIcon,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      width: size.width * 1,
      margin: const EdgeInsets.all(
        10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          AutoSizeText(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            maxFontSize: 22,
            minFontSize: 18,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          AutoSizeText(
            subtitle,
            textAlign: TextAlign.center,
            maxLines: 2,
            maxFontSize: 16,
            minFontSize: 10,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          withIcon
              ? Icon(
                  icon,
                  size: 50,
                  color: Colors.black87,
                )
              : Image.asset(
                  fit: BoxFit.contain,
                  width: size.width,
                  height: size.width / 2.618,
                  image!,
                  package: 'core',
                ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
