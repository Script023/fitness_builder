import 'package:flutter/material.dart';

class StarButton extends StatefulWidget {
  const StarButton({super.key});

  @override
  State<StarButton> createState() => _StarButtonState();
}

class _StarButtonState extends State<StarButton> {
  // Track selection state
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.star_rounded,
        // Change color when selected
        color: _isSelected ? const Color(0xFFE2F163) : Colors.grey,
        size: 15,
      ),
      onPressed: () {
        setState(() {
          _isSelected = !_isSelected; // Toggle state
        });
      },
    );
  }
}