
import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // do something here it has been pressed
      },
      customBorder: const CircleBorder(),
      child: Container(
        width: 23,
        height: 23,
        decoration: const BoxDecoration(
          color: Color(0xFF896CFE),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.play_arrow_rounded,
            color: Colors.white, // Sets the fill color to white
            size: 24, // Optional: Adjust size if needed
          ),
        ),
      ),
    );
  }
}