
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  final Widget starIconArticle;
  final String imagePath;
  const ArticleWidget({
    super.key,
    this.starIconArticle = const StarButton2(),
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      height: 134,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                width: 157,
                height: 134,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(top: 0, right: 0, child: starIconArticle),
        ],
      ),
    );
  }
}

class StarButton2 extends StatefulWidget {
  const StarButton2({super.key});

  @override
  State<StarButton2> createState() => _StarButton2State();
}

class _StarButton2State extends State<StarButton2> {
  // Track selection state
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.star_rounded,
        // Change color when selected
        color: _isSelected ? const Color(0xFFE2F163) : Colors.grey,
        size: 24,
      ),
      onPressed: () {
        setState(() {
          _isSelected = !_isSelected; // Toggle state
        });
      },
    );
  }
}
