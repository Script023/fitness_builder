import 'package:flutter/widgets.dart';

class IndicatorBar extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double radius;

  const IndicatorBar({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.radius,
  });

  const IndicatorBar.active({
    super.key,
    this.width = 20,
    this.height = 4,
    this.color = AppColor.activeColor,
    this.radius = 12,
  });

  const IndicatorBar.inactive({
    super.key,
    this.width = 20,
    this.height = 4,
    this.color = AppColor.inactiveColor,
    this.radius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}


class AppColor {
  static const Color activeColor = Color(0xFFFFFFFF);
  static const Color inactiveColor = Color(0xFF896CFE);
}
