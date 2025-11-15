import 'package:flutter/material.dart';

class Responsive {
  static final baseWidth = 440.0; // design width

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static bool isMobile(BuildContext context) => screenWidth(context) < 600;

  static double width(BuildContext c) => MediaQuery.of(c).size.width;
  static double height(BuildContext c) => MediaQuery.of(c).size.height;

  /// A scaled size based on screen width; good for padding, icons, font sizes.
  static double scaleWidth(BuildContext c, double value) {
    return value * (width(c) / baseWidth);
  }

  static double scaleFont(BuildContext c, double value) {
    return value * (width(c) / baseWidth);
  }

  /// Choose number of columns based on available width (useful for grids)
  static int columns(BuildContext c) {
    final w = width(c);
    if (w >= 900) return 4;
    if (w >= 600) return 3;
    return 2;
  }
}
