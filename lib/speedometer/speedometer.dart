import 'dart:math' as math;

import 'package:flutter/material.dart';

class SpeedOMeter extends CustomPainter {
  SpeedOMeter({
    required this.inputValue,
  });

  int inputValue = 0;
  var minValue = 5;
  var maxValue = 35;

  double piValue = math.pi;

  double degreeToRadian(double degree) {
    return degree * piValue / 180;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //Red and green speed indicator sections
    var archAngle = piValue / 6;
    var gapAngle = degreeToRadian(3);
    var radius = size.width / 2;

    var redSection = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13;

    var startAngel180 = piValue;
    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        startAngel180,
        archAngle - gapAngle,
        false,
        redSection);

    var angel210 = (7 * piValue) / 6;
    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        angel210,
        (archAngle - gapAngle),
        false,
        redSection);

    var angel240 = (4 * piValue) / 3;
    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        angel240,
        (archAngle - gapAngle),
        false,
        redSection);

    var greenSection = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13;

    var angel270 = (3 * piValue) / 2;
    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        angel270,
        (archAngle - gapAngle),
        false,
        greenSection);

    var angel300 = (5 * piValue) / 3;
    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        angel300,
        (archAngle - gapAngle),
        false,
        greenSection);

    var angel330 = (11 * piValue) / 6;
    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        angel330,
        (archAngle),
        false,
        greenSection);

//Speedometer pointer
    Paint pivot1Paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      6,
      pivot1Paint,
    );

    var circleRadius = size.width / 2;
    var compassLength = (circleRadius) * 0.75;

    if (inputValue < minValue) inputValue = minValue;

    if (inputValue > maxValue) inputValue = maxValue;

    var degreeVal = ((inputValue - minValue) * piValue) / (maxValue - minValue);

    var compassEndX = circleRadius - (compassLength * math.cos(degreeVal));
    var compassEndY = circleRadius - (compassLength * math.sin(degreeVal));

    Paint compassPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawLine(
      Offset(size.width / 2, size.height / 2),
      Offset(compassEndX, compassEndY),
      compassPaint,
    );

    Paint pivot2Paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      3,
      pivot2Paint,
    );

//Speedometer labels
    final TextPainter textPainter = TextPainter(
        text: const TextSpan(text: 'S3', style: TextStyle(color: Colors.red)),
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width);
    textPainter.paint(canvas, Offset(-30, size.height / 2));

    var dx = radius -
        (radius * math.cos(degreeToRadian(30))) -
        30 * math.cos(degreeToRadian(30));
    var dy = radius -
        (radius * math.sin(degreeToRadian(30))) -
        30 * math.tan(degreeToRadian(30));
    var offsetS2 = Offset(dx, dy);
    final TextPainter textPainter2 = TextPainter(
        text: const TextSpan(text: 'S2', style: TextStyle(color: Colors.red)),
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width / 2);
    textPainter2.paint(canvas, offsetS2);

    dx = radius -
        (radius * math.cos(degreeToRadian(60))) -
        25 * math.cos(degreeToRadian(30));
    dy = radius -
        (radius * math.sin(degreeToRadian(60))) -
        32 * math.tan(degreeToRadian(30));
    var offsetS1 = Offset(dx, dy);
    final TextPainter textPainter3 = TextPainter(
        text: const TextSpan(text: 'S1', style: TextStyle(color: Colors.red)),
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width);
    textPainter3.paint(canvas, offsetS1);

    dx = size.width / 2 - 25;
    dy = -30;
    var offsetp = Offset(dx, dy);
    final TextPainter textPainter4 = TextPainter(
        text: const TextSpan(
            text: 'PIVOT', style: TextStyle(color: Colors.black)),
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width);
    textPainter4.paint(canvas, offsetp);

    dx = size.width + 10;
    dy = size.height / 2;
    var offsetR3 = Offset(dx, dy);
    final TextPainter textPainter5 = TextPainter(
        text: const TextSpan(text: 'R3', style: TextStyle(color: Colors.green)),
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width);
    textPainter5.paint(canvas, offsetR3);

    dx = radius + (radius * math.cos(degreeToRadian(25)));
    dy = radius - (radius * math.sin(degreeToRadian(40)));
    var offsetR2 = Offset(dx, dy);
    final TextPainter textPainter6 = TextPainter(
        text: const TextSpan(text: 'R2', style: TextStyle(color: Colors.green)),
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width);
    textPainter6.paint(canvas, offsetR2);

    dx = radius + (radius * math.cos(degreeToRadian(60)));
    dy = radius - (radius * math.sin(degreeToRadian(90))) - 5;
    var offsetR1 = Offset(dx, dy);
    final TextPainter textPainter7 = TextPainter(
        text: const TextSpan(text: 'R1', style: TextStyle(color: Colors.green)),
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width);
    textPainter7.paint(canvas, offsetR1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
