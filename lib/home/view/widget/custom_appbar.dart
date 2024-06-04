import 'package:flutter/material.dart';


class CurvedTickAppBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
       Paint paint = Paint();
    paint.color = const Color.fromARGB(255, 126, 20, 12);// Change this to your desired color
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
