import 'package:flutter/material.dart';

class GoalPicker extends StatelessWidget {
  final List<String> options;

  // The currently selected index.
  final int? selectedIndex;

  // Tells the parent which index was selected/unselected.
  final ValueChanged<int?>? onChanged;

  const GoalPicker({
    super.key,
    required this.options,
    required this.selectedIndex,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(options.length, (index) {
        // Is this particular option the selected one?
        final isSelected = selectedIndex == index;

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: GestureDetector(
            onTap: () {
              // If the user taps the currently selected option,
              // unselect it.
              if (selectedIndex == index) {
                onChanged?.call(null);
              } else {
                // Otherwise select this option.
                onChanged?.call(index);
              }
            },
            child: Container(
              height: 62,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(31),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      options[index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  _RadioCircle(
                    selected: isSelected,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _RadioCircle extends StatelessWidget {
  final bool selected;

  const _RadioCircle({
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: selected
          ? Center(
              child: Container(
                width: 14,
                height: 14,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
            )
          : null,
    );
  }
}