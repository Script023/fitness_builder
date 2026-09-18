import 'package:fitness_builder/theme/app_colors.dart';
import 'package:fitness_builder/widget/created_widgets/box_shape_widget.dart';
import 'package:fitness_builder/views/account_creation_folder/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding4Screen extends StatefulWidget {
  const Onboarding4Screen({super.key});

  @override
  State<Onboarding4Screen> createState() => _Onboarding4ScreenState();
}

class _Onboarding4ScreenState extends State<Onboarding4Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background image of the man
          Image.asset(
            'assets/images/oldmanWork.png',
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

          Positioned(
            top: 300,
            left: 1,
            right: 1,
            child: Center(
              child: Container(
                width: 395,
                height: 170,
                decoration: BoxDecoration(color: AppColors.secondaryLight),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 14),
                    SvgPicture.asset(
                      'assets/images/Community.svg',
                      width: 38,
                      height: 40,
                    ),
                    SizedBox(height: 10),
                    SizedBox(width: 2),
                    Text(
                      'A Community For You,\n Challenge Yourself',
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
                        const IndicatorBar.inactive(),
                        SizedBox(width: 3),
                        const IndicatorBar.inactive(),
                        SizedBox(width: 3),
                        const IndicatorBar.active(),
                      ],
                    ),
                    //put the buttons under here
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 485,
            left: 80,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Material(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(100),
                child: InkWell(
                  splashColor: AppColors.primary,
                  highlightColor: AppColors.primary,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginViewScreen(),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 211,
                    height: 44,
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight(800),
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
