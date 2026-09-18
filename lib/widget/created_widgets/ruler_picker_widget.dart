import 'package:flutter/material.dart';

class RulerPicker extends StatefulWidget {
  final int min;
  final int max;
  final int initialValue;
  final ValueChanged<int> onChanged;

  const RulerPicker({
    super.key,
    this.min = 0,
    this.max = 200,
    this.initialValue = 75,
    required this.onChanged,
  });

  @override
  State<RulerPicker> createState() => _RulerPickerState();
}

class _RulerPickerState extends State<RulerPicker> {
  static const double tickSpacing = 15.0;
  late FixedExtentScrollController _controller;
  late int _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialValue;
    _controller = FixedExtentScrollController(
      initialItem: _selected - widget.min,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = widget.max - widget.min + 1;

    return SizedBox(
      height: 90,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // --- the scrolling ticks, rotated 90° to run horizontally ---
          RotatedBox(
            quarterTurns: 3,
            child: ListWheelScrollView.useDelegate(
              controller: _controller,
              itemExtent: tickSpacing,
              diameterRatio: 100, // huge fake radius -> looks flat
              perspective: 0.0001, // near-zero -> no 3D distortion
              physics: const FixedExtentScrollPhysics(), // snaps per tick
              onSelectedItemChanged: (index) {
                setState(() => _selected = widget.min + index);
                widget.onChanged(_selected);
              },
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: itemCount,
                builder: (context, index) {
                  final value = widget.min + index;
                  final isMajor = value % 5 == 0;
                  return RotatedBox(
                    quarterTurns: 1, // rotate the tick back upright
                    child: Center(
                      child: Container(
                        width: 2,
                        height: isMajor ? 40 : 20,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // --- fixed indicator: does NOT scroll, always centered ---
          IgnorePointer(
            child: Container(width: 3, height: 55, color: Colors.yellow),
          ),
        ],
      ),
    );
  }
}
