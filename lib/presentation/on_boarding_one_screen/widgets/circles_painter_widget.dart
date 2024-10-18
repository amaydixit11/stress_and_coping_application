import 'package:flutter/material.dart';

class CirclesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    double circle1Radius = size.height * 0.5;
    double circle2Radius = size.height * 0.45;

    double circle1CenterX = size.width * 0.15;
    double circle2CenterX = size.width * 0.85;

    double circleCenterY = size.height * 0.5;

    canvas.drawCircle(
      Offset(circle1CenterX, circleCenterY),
      circle1Radius,
      paint,
    );

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.white;

    canvas.drawCircle(
      Offset(circle2CenterX, circleCenterY),
      circle2Radius,
      strokePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
