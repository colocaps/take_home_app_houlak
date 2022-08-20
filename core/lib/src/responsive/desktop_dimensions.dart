import 'package:core/src/responsive/dimens.dart';
import 'package:flutter/material.dart';

class DesktopDimensions extends BaseDimensions implements Dimensions {
  final BuildContext context;

  DesktopDimensions(this.context);

  @override
  double get left => toPoints(32.0);

  @override
  double get top => toPoints(16.0);

  @override
  double get right => toPoints(32.0);

  @override
  double get bottom => toPoints(16.0);

  @override
  double toPoints(double value) {
    return value * getScale();
  }

  double getScale() {
    final width = MediaQuery.of(context).size.width;
    if (width > 1300) {
      return 1.5;
    } else if (width > 1000) {
      return 1.4;
    } else if (width > 800) {
      return 1.3;
    }

    return 1.2;
  }

  @override
  double toFontSize(double value) {
    return value * _getFontSizeScale();
  }

  double _getFontSizeScale() {
    final width = MediaQuery.of(context).size.width;
    if (width > 1300) {
      return 1.4;
    } else if (width > 1000) {
      return 1.3;
    } else if (width > 800) {
      return 1.2;
    }

    return 1.1;
  }

  @override
  EdgeInsets get contentPadding =>
      EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1);

  @override
  double scale(double value) {
    return value * 1;
  }
}
