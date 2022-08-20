import 'package:core/core.dart';
import 'package:core/src/containers/desktop_page_container.dart';
import 'package:core/src/containers/mobile_page_container.dart';
import 'package:core/src/responsive/dimens.dart';
import 'package:core/src/responsive/mobile_dimensions.dart';
import 'package:flutter/material.dart';

class PageContainerWithIcon extends StatelessWidget {
  final String title;
  final Widget? titleWidget;
  final bool centerTitle;
  final String subtitle;
  final String iconSrc;
  final String? imagePackage;
  final Widget landingRight;
  final Widget landingLeft;
  final Widget body;
  final Color bgColor;
  final Color? appBarColor;
  final Color titleColor;
  final List<BreadcrumbItem>? breadcrumbItems;
  final bool withFooter;
  final bool withoutContentPadding;
  final bool showBoxContainer;
  final bool showIconContainer;
  final bool withSubtitle;
  final double? appBarHeight;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PageContainerWithIcon({
    Key? key,
    this.title = '',
    required this.body,
    this.breadcrumbItems,
    this.withFooter = false,
    this.withoutContentPadding = false,
    this.withSubtitle = true,
    this.subtitle = 'subtitle',
    required this.iconSrc,
    this.imagePackage,
    this.landingRight = const SizedBox.shrink(),
    this.landingLeft = const SizedBox.shrink(),
    this.bgColor = Colors.white,
    this.titleColor = Colors.white,
    this.showBoxContainer = true,
    this.showIconContainer = true,
    this.titleWidget,
    this.centerTitle = true,
    this.appBarHeight,
    this.appBarColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildMobilePage(context);
  }

  Widget _buildMobilePage(BuildContext context) {
    final titleStyle = ApplicationTheme.light;
    final padding = Dimens.of(context).toPoints(22.0);
    final leftPadding = Dimens.of(context).toPoints(1.0);
    return MobilePageContainer(
        scaffoldKey: _scaffoldKey,
        bgColor: bgColor,
        appBar: AppBar(
          toolbarHeight: appBarHeight,
          elevation: 0,
          backgroundColor: appBarColor,
          title: Tooltip(
            message: title,
            height: 40,
            verticalOffset: 20,
            child: titleWidget ??
                Text(
                  title,
                  style: titleStyle.textTheme.titleSmall,
                ),
          ),
          centerTitle: centerTitle,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: padding),
              child: landingRight,
            )
          ],
          leading: Padding(
            padding: EdgeInsets.only(left: leftPadding),
            child: landingLeft,
          ),
        ),
        withoutContentPadding: withoutContentPadding,
        body: showBoxContainer
            ? Stack(
                children: <Widget>[
                  _buildBoxContainer(),
                  if (showIconContainer) _buildIconContainer(context),
                ],
              )
            : body);
  }

  Widget _buildBoxContainer() => Builder(builder: (context) {
        final subtitleStyle = ApplicationTheme.light;
        return Column(
          children: [
            if (withSubtitle)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 140,
                    bottom: 6,
                    top: 1.0,
                  ),
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.left,
                    style: subtitleStyle.textTheme.subtitle1,
                  ),
                ),
              ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    color: Colors.white),
                child: body,
              ),
            ),
          ],
        );
      });

  Widget _buildIconContainer(BuildContext context) {
    final dimens = MobileDimensions(context);
    return Positioned(
      left: 46,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                spreadRadius: 0.5,
                offset: Offset(0, 4))
          ],
        ),
        child: Hero(
          tag: iconSrc,
          child: CircleAvatar(
            radius: dimens.scale(40),
            backgroundColor: bgColor,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: dimens.scale(33),
              child: Image.asset(
                iconSrc,
                package: imagePackage,
                height: dimens.scale(40),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
