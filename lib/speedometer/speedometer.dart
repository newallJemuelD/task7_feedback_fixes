import 'dart:math' as math;

import 'package:flutter/material.dart';

class SpeedOMeter extends StatelessWidget {
  final BuildContext context;
  final MaterialColor sColor;
  final MaterialColor rColor;
  double size;
  SpeedOMeter({
    Key? key,
    required this.size,
    required this.context,
    required this.sColor,
    required this.rColor,
    required this.inputValue,
  }) : super(key: key);

  final String? inputValue;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (size < 200) {
      size = 200;
    } else if (size > 300) {
      size = screenWidth - 90;
    } else {
      size = size;
    }

    return CustomPaint(
      size: Size(size, size),
      painter: SpeedOMeterPainter(
        context: context,
        sColor: sColor,
        rColor: rColor,
        inputValue: double.parse(inputValue ?? '0'),
      ),
    );
  }
}

class SpeedOMeterPainter extends CustomPainter {
  MaterialColor sColor;
  MaterialColor rColor;
  BuildContext context;
  double inputValue = 0.0;
  SpeedOMeterPainter({
    required this.context,
    required this.sColor,
    required this.rColor,
    required this.inputValue,
  });

  double minValue = 5;
  double maxValue = 35;
  double piValue = math.pi;

  double degreeToRadian(double degree) {
    return degree * piValue / 180;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var archAngle = piValue / 6;
    var gapAngle = degreeToRadian(3);
    var radius = size.width / 2;
    var circleRadius = size.width / 2;
    var compassLength = (circleRadius) * 0.75;
    if (inputValue < minValue) inputValue = minValue;
    if (inputValue > maxValue) inputValue = maxValue;
    var degreeVal = ((inputValue - minValue) * piValue) / (maxValue - minValue);
    var compassEndX = circleRadius - (compassLength * math.cos(degreeVal));
    var compassEndY = circleRadius - (compassLength * math.sin(degreeVal));

    //Red and green speed indicator sections
    var redSection = Paint()
      ..color = sColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13;

    var angel180 = piValue;
    canvas.drawArc(
      _arcRect(size),
      angel180,
      archAngle - gapAngle,
      false,
      redSection,
    );

    var angel210 = (7 * piValue) / 6;
    canvas.drawArc(
      _arcRect(size),
      angel210,
      (archAngle - gapAngle),
      false,
      redSection,
    );

    var angel240 = (4 * piValue) / 3;
    canvas.drawArc(
      _arcRect(size),
      angel240,
      (archAngle - gapAngle),
      false,
      redSection,
    );

    var greenSection = Paint()
      ..color = rColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13;

    var angel270 = (3 * piValue) / 2;
    canvas.drawArc(
      _arcRect(size),
      angel270,
      (archAngle - gapAngle),
      false,
      greenSection,
    );

    var angel300 = (5 * piValue) / 3;
    canvas.drawArc(
      _arcRect(size),
      angel300,
      (archAngle - gapAngle),
      false,
      greenSection,
    );

    var angel330 = (11 * piValue) / 6;
    canvas.drawArc(
      _arcRect(size),
      angel330,
      (archAngle),
      false,
      greenSection,
    );

//Speedometer pointer
    Paint pivot1Paint = Paint()
      ..color = Theme.of(context).iconTheme.color!
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      6,
      pivot1Paint,
    );

    Paint compassPaint = Paint()
      ..color = Theme.of(context).iconTheme.color!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawLine(
      Offset(size.width / 2, size.height / 2),
      Offset(compassEndX, compassEndY),
      compassPaint,
    );

    Paint pivot2Paint = Paint()
      ..color = Theme.of(context).scaffoldBackgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      3,
      pivot2Paint,
    );

//Speedometer labels
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: 'S3', style: TextStyle(color: sColor)),
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
        text: TextSpan(text: 'S2', style: TextStyle(color: sColor)),
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
        text: TextSpan(text: 'S1', style: TextStyle(color: sColor)),
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width);
    textPainter3.paint(canvas, offsetS1);

    dx = size.width / 2 - 25;
    dy = -30;
    var offsetp = Offset(dx, dy);
    final TextPainter textPainter4 = TextPainter(
        text: TextSpan(
            text: 'PIVOT',
            style: TextStyle(color: Theme.of(context).iconTheme.color)),
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width);
    textPainter4.paint(canvas, offsetp);

    dx = size.width + 12;
    dy = size.height / 2;
    var offsetR3 = Offset(dx, dy);
    final TextPainter textPainter5 = TextPainter(
        text: TextSpan(text: 'R3', style: TextStyle(color: rColor)),
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width);
    textPainter5.paint(canvas, offsetR3);

    dx = radius + (radius * math.cos(degreeToRadian(17)));
    dy = radius - (radius * math.sin(degreeToRadian(35)));
    var offsetR2 = Offset(dx, dy);
    final TextPainter textPainter6 = TextPainter(
        text: TextSpan(text: 'R2', style: TextStyle(color: rColor)),
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width);
    textPainter6.paint(canvas, offsetR2);

    dx = radius + (radius * math.cos(degreeToRadian(57)));
    dy = radius - (radius * math.sin(degreeToRadian(85))) - 5;
    var offsetR1 = Offset(dx, dy);
    final TextPainter textPainter7 = TextPainter(
        text: TextSpan(text: 'R1', style: TextStyle(color: rColor)),
        textDirection: TextDirection.ltr)
      ..layout(maxWidth: size.width);
    textPainter7.paint(canvas, offsetR1);
  }

//common code for drawing arc
  Rect _arcRect(Size size) {
    return Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width,
      height: size.height,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
