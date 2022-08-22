import 'package:flutter/material.dart';

class HomeSearchField extends StatelessWidget {
  final void Function(String)? _onFieldSubmitted;

  const HomeSearchField({
    Key? key,
    required void Function(String)? onFieldSubmitted,
  })  : _onFieldSubmitted = onFieldSubmitted,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return TextFormField(
      controller: textEditingController,
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Color(0xff1DB954),
            width: 2.0,
          ),
        ),
        isDense: true,
        errorMaxLines: 1,
        errorStyle: const TextStyle(
          color: Colors.transparent,
          fontSize: 0,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        filled: true,
        hintText: 'Busca artistas',
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        fillColor: Colors.grey[800],
      ),
      onFieldSubmitted: _onFieldSubmitted,
    );
  }
}
