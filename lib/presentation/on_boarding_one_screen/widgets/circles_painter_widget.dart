import 'package:flutter/material.dart';

class CirclesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    // Draw the first circle (filled white with white stroke)
    canvas.drawCircle(
      Offset(6.5, 6.5), // Center of the first circle
      6, // Radius of the first circle
      paint, // Filled with white color
    );
    // Draw the second circle (white stroke, no fill)
    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.white;

    canvas.drawCircle(
      Offset(35.5, 6.5), // Center of the second circle
      5.5, // Radius of the second circle
      strokePaint, // Only stroke with white color
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
