import 'package:flutter/material.dart';

import 'desktop_dimensions.dart';
import 'mobile_dimensions.dart';

abstract class Dimens implements Dimensions {
  static const double mobileScreenBreakpoint = 650.0;
  static const double desktopBreakpoint = 900.0;

  static Dimensions of(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if (width <= mobileScreenBreakpoint) {
      return MobileDimensions(context);
    }

    return DesktopDimensions(context);
  }
}

abstract class Dimensions {
  double get left;
  double get right;
  double get top;
  double get bottom;

  EdgeInsets get vertical;

  EdgeInsets get horizontal;

  EdgeInsets get all;

  EdgeInsets get onlyBottom;

  EdgeInsets get onlyLeft;

  EdgeInsets get onlyRight;

  EdgeInsets get onlyTop;

  double toPoints(double value);

  double toFontSize(double value);

  double scale(double value);

  EdgeInsets get contentPadding;
}

abstract class BaseDimensions implements Dimensions {
  @override
  EdgeInsets get vertical => EdgeInsets.only(top: top, bottom: bottom);

  @override
  EdgeInsets get horizontal => EdgeInsets.only(left: left, right: right);

  @override
  EdgeInsets get all =>
      EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);

  @override
  EdgeInsets get onlyBottom => EdgeInsets.only(bottom: bottom);

  @override
  EdgeInsets get onlyLeft => EdgeInsets.only(left: left);

  @override
  EdgeInsets get onlyRight => EdgeInsets.only(right: right);

  @override
  EdgeInsets get onlyTop => EdgeInsets.only(top: top);
}
