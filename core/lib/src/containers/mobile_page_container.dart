import 'package:core/src/responsive/dimens.dart';
import 'package:flutter/material.dart';

class MobilePageContainer extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final bool withoutContentPadding;
  final Color bgColor;
  final Key? scaffoldKey;
  final Widget? floatingActionButton;

  const MobilePageContainer({
    Key? key,
    this.appBar,
    required this.body,
    this.withoutContentPadding = false,
    this.scaffoldKey,
    this.bgColor = Colors.white,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      backgroundColor: bgColor,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: withoutContentPadding
                  ? EdgeInsets.zero
                  : Dimens.of(context).contentPadding,
              child: body,
            ),
          ),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
