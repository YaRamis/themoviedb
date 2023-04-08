import 'dart:math';

import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/theme/app_colors.dart';

class RadialPercentWidget extends StatelessWidget {
  final double percent;
  final double sizeOfBox;

  const RadialPercentWidget(
      {Key? key, required this.percent, required this.sizeOfBox})
      : super(key: key);

  final percentIcon = Icons.percent_rounded;

  Text get percentText {
    return Text(
      '${(percent * 100).toInt()}',
      style: TextStyle(
        color: Colors.white,
        fontSize: sizeOfBox * 0.32,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        percentText,
        topRightCornerIcon(percentIcon),
      ],
    );

    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: MyPainter(percent)),
          Center(child: child),
        ],
      ),
    );
  }

  Padding topRightCornerIcon(IconData icon) {
    return Padding(
      padding: EdgeInsets.only(bottom: sizeOfBox * 0.125),
      child: Icon(
        icon,
        size: sizeOfBox * 0.16,
        color: Colors.white,
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  double percent;

  MyPainter(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    drawBackground(canvas, size);

    drawRadialBackground(canvas, size);

    final color = getColor(percent);
    drawRadialPercent(color, canvas, size);
  }

  void drawRadialPercent(Color color, Canvas canvas, Size size) {
    final radius = size.height < size.width ? size.height / 2 : size.width / 2;
    final paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = radius * 2 * 0.07;
    paint.strokeCap = StrokeCap.round;
    canvas.drawArc(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: radius * 0.825,
        ),
        3 * pi / 2,
        2 * pi * percent,
        false,
        paint);
  }

  void drawRadialBackground(Canvas canvas, Size size) {
    final radius = size.height < size.width ? size.height / 2 : size.width / 2;
    final paint = Paint();
    paint.color = AppColors.themeColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = radius * 2 * 0.07;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), radius * 0.825, paint);
  }

  void drawBackground(Canvas canvas, Size size) {
    final radius = size.height < size.width ? size.height / 2 : size.width / 2;
    final paint = Paint();
    paint.color = const Color(0xFF02182A);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  Color getColor(double percent) {
    var alpha = 255;
    var blue = 150;
    int red, green;

    if (percent <= 0.5) {
      red = 255;
      green = (255 * percent * 2).toInt();
    } else {
      red = (255 * (1.0 - percent) * 2).toInt();
      green = 255;
    }

    return Color.fromARGB(alpha, red, green, blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
