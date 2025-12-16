import 'package:flutter/material.dart';
import 'dart:math';

class CirclePainter extends CustomPainter {
  CirclePainter({required this.color});
  
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var center = size.center(Offset.zero);
    var radius = size.width / 2;

    // Draw the lines emanating from the center
    for (int i = 0; i < 13; i++) {
      double angle = 2 * pi / 50 * i;
      double startX = center.dx;
      double startY = center.dy;
      double endX = center.dx + radius * cos(angle);
      double endY = center.dy + radius * sin(angle);

      final linePaint = Paint()
        ..color = color.withOpacity(0.5)
        ..strokeWidth = 10;

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}