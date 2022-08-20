import 'package:flutter/material.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return TextFormField(
      controller: textEditingController,
      style: Theme.of(context).textTheme.bodyMedium,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        isDense: true,
        errorMaxLines: 1,
        errorStyle: const TextStyle(
          color: Colors.transparent,
          fontSize: 0,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        filled: true,
        hintText: 'Busca artistas o canciones',
        hintStyle: TextStyle(
          color: Colors.grey[800],
          fontSize: 10,
        ),
        fillColor: Colors.white70,
      ),
      onChanged: (String input) {},
      onFieldSubmitted: (String input) {},
    );
  }
}
