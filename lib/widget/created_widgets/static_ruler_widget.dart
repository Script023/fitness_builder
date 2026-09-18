import 'package:flutter/material.dart';


/// A purely decorative ruler strip — no scrolling, no interaction.
/// The actual value is picked elsewhere (your number wheel above);
/// this just visually echoes it.
class StaticRuler extends StatelessWidget {
  // create variables such as tickSpacing, minorHeight, majorHeight, tickColor, and indicator color
  final double tickSpacing;
  final double minorHeight;
  final double majorHeight;
  final Color tickColor;
  final Color indicatorColor;

  const StaticRuler({
    super.key,
    this.tickSpacing = 15.0,
    this.minorHeight = 20.0,
    this.majorHeight = 40.0,
    this.tickColor = Colors.white,
    this.indicatorColor = Colors.yellow,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //create this imaginary boundary which will house the ruler with a specific sizedbox height
      height: 60,
      child: Stack(
        // create a stack widget
        alignment: Alignment.center,
        children: [
          //custompaint widget having keys such as size and painter
          CustomPaint(
            // i think this guy would take the size.width and size.height of the container
            // using the infinite value will definitely mean that it will check its available space
            size: Size.infinite,
            painter: _RulerPainter(
              tickSpacing: tickSpacing,
              minorHeight: minorHeight,
              majorHeight: majorHeight,
              tickColor: tickColor,
              indicatorColor: indicatorColor,
            ),
          ),
          // fixed indicator line, always dead center, drawn on top
          // Container(width: 3, height: majorHeight + 15, color: indicatorColor),
        ],
      ),
    );
  }
}

class _RulerPainter extends CustomPainter {
  final double tickSpacing;
  final double minorHeight;
  final double majorHeight;
  final Color tickColor;
  final Color indicatorColor;

  _RulerPainter({
    required this.tickSpacing,
    required this.minorHeight,
    required this.majorHeight,
    required this.tickColor,
    required this.indicatorColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = tickColor
      ..strokeWidth = 2;

    final centerY = size.height / 2;
    // start ticks from the horizontal center and work outward, so the
    // pattern is symmetric around the fixed yellow line regardless of
    // the widget's width.
    final centerX = size.width / 2;
    int index = 0;
    // we are saying here for x = center of x and x also less than the size.width
    // apply that index after every iteration

    for (double x = centerX; x <= size.width; x += tickSpacing, index++) {
      final isMajor = index % 5 == 0;
      final h = isMajor ? majorHeight : minorHeight;
      if (x == centerX && h == majorHeight) {
        paint.color = indicatorColor;
        paint.strokeWidth = 3;
        canvas.drawLine(
          Offset(x, centerY - h / 2),
          Offset(x, centerY + h / 2),
          paint,
        );
      } else {
        paint.color = tickColor;
        paint.strokeWidth = 2;
        canvas.drawLine(
          // this was where i stopped being good in maths
          Offset(x, centerY - h / 2),
          Offset(x, centerY + h / 2),
          paint,
        );
      }
    }
    index = 1;
    for (double x = centerX - tickSpacing; x >= 0; x -= tickSpacing, index++) {
      final isMajor = index % 5 == 0;
      final h = isMajor ? majorHeight : minorHeight;
      canvas.drawLine(
        Offset(x, centerY - h / 2),
        Offset(x, centerY + h / 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _RulerPainter oldDelegate) => false;
}
