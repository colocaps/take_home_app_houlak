import 'package:core/src/responsive/dimens.dart';
import 'package:flutter/material.dart';

class MobileDimensions extends BaseDimensions implements Dimensions {
  final BuildContext context;

  MobileDimensions(this.context);

  @override
  double get left => toPoints(8.0);

  @override
  double get top => toPoints(8.0);

  @override
  double get right => toPoints(8.0);

  @override
  double get bottom => toPoints(8.0);

  @override
  double toPoints(double value) {
    final width = MediaQuery.of(context).size.width;
    if (width <= 360) {
      return value * 0.8;
    }

    if (width >= 500) {
      return value * 1.2;
    }

    return value;
  }

  @override
  double toFontSize(double value) {
    return value * _getFontSizeScale();
  }

  double _getFontSizeScale() {
    final width = MediaQuery.of(context).size.width;
    if (width >= 500) {
      return 1.2;
    }

    return 1;
  }

  @override
  EdgeInsets get contentPadding => EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width * 0.04);

  @override
  double scale(double value) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 400) {
      return value * 1.2;
    }
    return value;
  }
}
