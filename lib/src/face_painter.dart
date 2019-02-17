/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'face.dart' show Face;

////////////////////////////////////////////////////////////////////////////////

class FacePainter extends CustomPainter {
  final List<Face> faces;
  final double eyeRadius;
  final Color color;
  final double strokeWidth;

  FacePainter({
    this.faces,
    this.eyeRadius = 12,
    this.color = Colors.blue,
    this.strokeWidth = 2,
  });

  @override
  void paint(final Canvas canvas, final Size size) {
    final line = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = strokeWidth;

    for (final face in faces) {
      final midPoint = Offset(face.midPoint.x, face.midPoint.y);
      final leftEye = midPoint.translate(-(face.eyesDistance/2), 0);
      final rightEye = midPoint.translate((face.eyesDistance/2), 0);
      final noseBridge = Path()
        ..moveTo(leftEye.dx+eyeRadius, leftEye.dy)
        ..quadraticBezierTo(midPoint.dx, midPoint.dy-eyeRadius,
            rightEye.dx-eyeRadius, rightEye.dy);
      canvas.drawCircle(leftEye, eyeRadius, line);
      canvas.drawCircle(rightEye, eyeRadius, line);
      canvas.drawPath(noseBridge, line);
    }
  }

  @override
  bool shouldRepaint(final FacePainter oldDelegate) => false;
}
