import 'package:fitness_builder/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding2_screen.dart';

class Onboarding1Screen extends StatefulWidget {
  const Onboarding1Screen({super.key});

  @override
  State<Onboarding1Screen> createState() => _Onboarding1ScreenState();
}

class _Onboarding1ScreenState extends State<Onboarding1Screen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Onboarding2Screen()),
          );
        } else {
          print('Widget is not mounted'); // Debug print
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background image
          Image.asset(
            'assets/images/womanFine.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withValues(alpha: 0.5),
          ),

          // welcome text
          Positioned(
            top: 306,
            left: 132,

            child: RichText(
              text: TextSpan(
                text: 'Welcome to',
                style: GoogleFonts.leagueSpartan(
                  fontSize: 25.47,
                  fontWeight: FontWeight(400),
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          // fitness icon
          Positioned(
            top: 345,
            left: 105,
            right: 105.63,
            child: SvgPicture.asset('assets/images/fitness_logo.svg'),
          ),
          // fitbody text
          Positioned(
            top: 400,
            left: 80,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'FIT',
                    style: GoogleFonts.poppins(
                      fontSize: 54.04,
                      fontWeight: FontWeight(700),
                      color: AppColors.primary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  TextSpan(
                    text: 'BODY',
                    style: GoogleFonts.poppins(
                      color: AppColors.primary,
                      fontSize: 54.04,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
