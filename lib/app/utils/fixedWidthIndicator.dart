// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FixedWidthIndicator extends Decoration {
  final double height;
  final double width;
  final Color color;

  const FixedWidthIndicator({
    required this.height,
    required this.width,
    required this.color,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _FixedWidthIndicatorPainter(
      height: height,
      width: width,
      color: color,
    );
  }
}

class _FixedWidthIndicatorPainter extends BoxPainter {
  final double height;
  final double width;
  final Color color;

  _FixedWidthIndicatorPainter({
    required this.height,
    required this.width,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double xCenter = offset.dx +
        (configuration.size!.width / 2) -
        (width / 2); // Center the indicator
    final double y = configuration.size!.height - height;

    final Rect rect = Rect.fromLTWH(xCenter, y, width, height);
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(height / 2)), // Rounded corners
      paint,
    );
  }
}
