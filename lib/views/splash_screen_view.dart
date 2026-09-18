import 'package:fitness_builder/theme/app_colors.dart';
import 'package:fitness_builder/views/onboarding/onboarding1_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFitnessApp extends StatefulWidget {
  const MyFitnessApp({super.key});

  @override
  State<MyFitnessApp> createState() => _MyFitnessAppState();
}

class _MyFitnessAppState extends State<MyFitnessApp> {
  @override
  void initState() {
    super.initState();
    print('Splash screen initState called'); // Debug print
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 4), () {
        print('3 seconds passed, navigating...'); // Debug print

        if (mounted) {
          print('Widget is mounted, navigating now'); // Debug print
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Onboarding1Screen()),
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
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/images/fitness_logo.svg',
                width: 135,
                height: 62.75,
              ),
              SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'FIT',

                      style: GoogleFonts.poppins(
                        color: AppColors.primary,
                        fontSize: 40,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text: 'BODY',
                      style: GoogleFonts.poppins(
                        color: AppColors.primary,
                        fontSize: 40,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
