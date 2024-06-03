import 'package:flutter/material.dart';
import 'package:catalogue/home/utils/constant.dart';

class CurvedTickAppBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
       Paint paint = Paint();
    paint.color = Constant.scaffoldBackground; // Change this to your desired color
    paint.style = PaintingStyle.fill;

    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
