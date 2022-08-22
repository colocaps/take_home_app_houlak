import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

abstract class AlertDialogUtils {
  static Future<void> showAlertWithOneAction({
    required BuildContext context,
    required Image image,
    required String title,
    required String subtitle,
    required VoidCallback okAction,
    required VoidCallback cancelAction,
    required String titleOkButton,
    required ThemeData theme,
  }) async {
    await showDialog(
      context: context,
      builder: (ctx) => CustomAlertDialog(
        image: image,
        title: title,
        subtitle: subtitle,
        titleOkButton: titleOkButton,
        titleCancelButton: '',
        okAction: okAction,
        cancelAction: cancelAction,
        theme: theme,
      ),
    );
  }

  static Future<void> showAlertWithTwoActions({
    required BuildContext context,
    required Image image,
    required String title,
    required String subtitle,
    required VoidCallback okAction,
    required String titleOkButton,
    required VoidCallback cancelAction,
    required String titleCancelButton,
    required ThemeData theme,
  }) async {
    await showDialog(
      context: context,
      builder: (ctx) => CustomAlertDialog(
        image: image,
        title: title,
        subtitle: subtitle,
        titleOkButton: titleOkButton,
        titleCancelButton: titleCancelButton,
        okAction: okAction,
        cancelAction: cancelAction,
        theme: theme,
      ),
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  final Image image;
  final String title;
  final String subtitle;
  final String titleOkButton;
  final VoidCallback okAction;
  final String titleCancelButton;
  final VoidCallback cancelAction;
  final ThemeData theme;

  const CustomAlertDialog({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.titleOkButton,
    required this.okAction,
    this.titleCancelButton = '',
    required this.cancelAction,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthButton = _getWithButtonBySizeScreen(size);
    final heightButton = _getHeightButtonBySizeScreen(size);
    final spaceButton = _getSpaceButtonBySizeScreen(size);
    return Center(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Card(
            color: Theme.of(context).highlightColor,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: image,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (titleCancelButton.isNotEmpty)
                        SizedBox(
                          width: widthButton,
                          height: heightButton,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red, // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: cancelAction,
                            child: SizedBox(
                              height: heightButton,
                              width: widthButton,
                              child: Center(
                                child: AutoSizeText(
                                  titleCancelButton.toUpperCase(),
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.button,
                                  minFontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (titleCancelButton.isNotEmpty)
                        SizedBox(
                          width: spaceButton,
                        ),
                      SizedBox(
                        width: widthButton,
                        height: heightButton,
                        child: ElevatedButton(
                          onPressed: okAction,
                          child: SizedBox(
                            height: heightButton,
                            width: widthButton - 20,
                            child: Center(
                              child: AutoSizeText(
                                titleOkButton.toUpperCase(),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.button,
                                minFontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _getSpaceButtonBySizeScreen(Size size) =>
      size.width > 320.0 ? 20.0 : 20 * 0.60;

  double _getHeightButtonBySizeScreen(Size size) =>
      size.width > 320.0 ? 40.0 : 40 * 0.8;

  double _getWithButtonBySizeScreen(Size size) =>
      size.width > 320.0 ? 110.0 : 110 * 0.75;
}
