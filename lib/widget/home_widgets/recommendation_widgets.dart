import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_builder/widget/home_widgets/star_icon_widgets.dart';
import'package:fitness_builder/widget/home_widgets/play_button_widgets.dart';

class RecommendationWidget extends StatefulWidget {
  final String imagePath;
  final String title;
  final String timetitle;
  final String caloriestitle;
  final Widget starIcon;
  final Widget playButton;
  const RecommendationWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.timetitle,
    required this.caloriestitle,
    this.playButton = const PlayButton(),
    this.starIcon = const StarButton(),
  });

  @override
  State<RecommendationWidget> createState() => _RecommendationWidgetState();
}

class _RecommendationWidgetState extends State<RecommendationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      height: 138,
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
                widget.imagePath,
                width: 157,
                height: 92,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            left: 11,
            child: Text(
              widget.title,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight(500),
                color: const Color(0xFFE2F163),
              ),
            ),
          ),
          Positioned(bottom: 105, right: 0, child: widget.starIcon),
          Positioned(top: 80, right: 10, child: widget.playButton),
          Positioned(
            bottom: 5,
            left: 11,
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: const Color(0xFF896CFE),
                  size: 12,
                ),
                SizedBox(width: 2),
                Text(
                  widget.timetitle,
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            right: 11,
            child: Row(
              children: [
                Icon(
                  Icons.local_fire_department,
                  color: const Color(0xFF896CFE),
                  size: 12,
                ),
                SizedBox(width: 2),
                Text(
                  widget.caloriestitle,
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
