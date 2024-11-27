// ignore_for_file: file_names

import 'package:flutter/widgets.dart';

class MediaQueryHelper {
  static late double screenWidth;
  static late double screenHeight;
  static late double devicePixelRatio;

  static void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
    devicePixelRatio = mediaQuery.devicePixelRatio;
  }

  static double getHeightPercentage(double percentage) {
    return screenHeight * percentage / 100;
  }

  static double getWidthPercentage(double percentage) {
    return screenWidth * percentage / 100;
  }
}
