import 'package:flutter/material.dart';

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // نبدأ من أعلى الشمال
    path.lineTo(0, size.height - 15);

    // التمويجة 1
    path.quadraticBezierTo(
      size.width * 0.125,
      size.height - 5,
      size.width * 0.25,
      size.height - 10,
    );

    // التمويجة 2
    path.quadraticBezierTo(
      size.width * 0.375,
      size.height - 15,
      size.width * 0.5,
      size.height - 10,
    );

    // التمويجة 3
    path.quadraticBezierTo(
      size.width * 0.625,
      size.height - 5,
      size.width * 0.75,
      size.height - 10,
    );

    // التمويجة 4
    path.quadraticBezierTo(
      size.width * 0.875,
      size.height - 15,
      size.width,
      size.height - 10,
    );

    // نقفل الشكل
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
