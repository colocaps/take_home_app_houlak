import 'package:core/core.dart';
import 'package:core/src/responsive/dimens.dart';
import 'package:flutter/material.dart';

class DesktopPageContainer extends StatelessWidget {
  final Widget? appBar;
  final Widget? body;
  final Widget? footer;
  final List<BreadcrumbItem>? breadcrumbItems;
  final bool withoutContentPadding;

  const DesktopPageContainer({
    Key? key,
    this.appBar,
    @required this.body,
    this.footer,
    this.breadcrumbItems,
    this.withoutContentPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contentPadding = Dimens.of(context).contentPadding;
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            appBar ?? const SizedBox.shrink(),
            _buildNavigationItems(context, contentPadding),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: withoutContentPadding
                        ? EdgeInsets.zero
                        : contentPadding,
                    child: body,
                  ),
                ],
              ),
            ),
            _buildFooter(contentPadding),
            /*Padding(
              padding: contentPadding,
              child: CopyrightView(),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(EdgeInsets contentPadding) {
    if (footer == null) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      color: ApplicationTheme.light.cardColor,
      child: Padding(
        padding: contentPadding,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: footer,
        ),
      ),
    );
  }

  Widget _buildNavigationItems(
    BuildContext context,
    EdgeInsets contentPadding,
  ) {
    if (breadcrumbItems == null) {
      return const SizedBox.shrink();
    }

    var index = 0;
    return Container(
      color: ApplicationTheme.colorCircleAvatar,
      child: Padding(
        padding: contentPadding,
        child: Row(
          children: breadcrumbItems!.map((e) {
            var widget =
                e.toWidget(context, index < breadcrumbItems!.length - 1);
            index++;
            return widget;
          }).toList(),
        ),
      ),
    );
  }
}

class BreadcrumbItem {
  final String title;
  final void Function()? onPressed;

  BreadcrumbItem(
    this.title,
    this.onPressed,
  );

  Widget toWidget(BuildContext context, bool isHistory) {
    var textStyle = ApplicationTheme.light;
    var color = Theme.of(context).primaryColorDark;
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 12.0, bottom: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: textStyle.textTheme.bodySmall,
            ),
            isHistory
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16.0,
                      color: color,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
