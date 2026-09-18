import 'package:fitness_builder/theme/app_colors.dart';
import 'package:fitness_builder/views/onboarding/onboarding3_screen.dart';
import 'package:fitness_builder/views/onboarding/onboarding4_screen.dart';
import 'package:fitness_builder/widget/created_widgets/box_shape_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding2Screen extends StatefulWidget {
  const Onboarding2Screen({super.key});

  @override
  State<Onboarding2Screen> createState() => _Onboarding2ScreenState();
}

class _Onboarding2ScreenState extends State<Onboarding2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background image of the man
          Image.asset(
            'assets/images/manSport.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          // shadowing of the image and making it darker
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withValues(alpha: 0.3),
          ),

          //skip button up top
          Positioned(
            top: 40,
            right: 20,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Onboarding4Screen(),
                      ),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: GoogleFonts.poppins(
                      color: AppColors.primary,
                      fontSize: 16,
                    ),
                  ),
                ),
                Icon(Icons.play_arrow, color: AppColors.primary),
              ],
            ),
          ),

          Positioned(
            top: 320,
            left: 1,
            right: 1,
            child: Center(
              child: Container(
                width: 395,
                height: 175,
                decoration: BoxDecoration(color: AppColors.secondaryLight),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 14),
                    SvgPicture.asset(
                      'assets/images/work_out.svg',
                      width: 38,
                      height: 40,
                    ),
                    SizedBox(height: 10),
                    SizedBox(width: 2),
                    Text(
                      'Start Your Journey Towards\n A More Active Lifestyle ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: AppColors.textPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight(800),
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        SizedBox(width: 142),
                        SizedBox(height: 35),
                        const IndicatorBar.active(),
                        SizedBox(width: 3),
                        const IndicatorBar.inactive(),
                        SizedBox(width: 3),
                        const IndicatorBar.inactive(),
                      ],
                    ),
                    //put the buttons under here
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 510,
            left: 80,
            right: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Material(
                color: Colors.grey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(100),
                child: InkWell(
                  splashColor: AppColors.primary,
                  highlightColor: AppColors.primary,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Onboarding3Screen(),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 211,
                    height: 44,
                    child: Center(
                      child: Text(
                        'Next',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
