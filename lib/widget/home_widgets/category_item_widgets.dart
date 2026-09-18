import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItemWidget extends StatefulWidget {
  final String title;
  final String svgpath;
  final Color selectedColor = const Color(0xFFE2F163);
  final Color unselectedColor = const Color(0xFF896CFE);

  const CategoryItemWidget({
    super.key,
    required this.title,
    required this.svgpath,
  });

  @override
  State<CategoryItemWidget> createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              // Toggle the selection state when the icon is pressed
              isSelected = !isSelected;
            });
            // push somewhere like another page
          },
          child: SvgPicture.asset(
            widget.svgpath,
            //conditionally apply color filter
            colorFilter: ColorFilter.mode(
              isSelected == true
                  ? widget.selectedColor
                  : widget.unselectedColor,
              BlendMode.srcIn,
            ),
            width: 32,
            height: 32,
          ),
        ),
        SizedBox(height: 5),
        Text(
          widget.title,
          style: GoogleFonts.leagueSpartan(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: isSelected == true
                ? widget.selectedColor
                : widget.unselectedColor,
          ),
        ),
      ],
    );
  }
}