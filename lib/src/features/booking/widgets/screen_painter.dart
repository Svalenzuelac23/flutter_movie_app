import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';

class ScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.principalColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(size.width * 0.07, size.height * 0.8);
    path.lineTo(size.width * 0.38, size.height * 0.35);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.25,
        size.width * 0.62, size.height * 0.35);
    path.lineTo(size.width * 0.93, size.height * 0.8);

    canvas.drawPath(path, paint);
    canvas.drawShadow(
        path, AppColors.principalColor.withOpacity(0.3), 10, false);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
