import 'package:fitness_builder/set_Up/set_up_gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_builder/theme/app_colors.dart';
import 'package:fitness_builder/providers/user_provider.dart';

class SetUpScreen extends ConsumerWidget {
  const SetUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('>>> SETUP SCREEN BUILT');
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        // Added scroll in case content exceeds screen
        child: Column(
          children: [
            Image.asset(
              'assets/images/womanCarryingGym.png',
              width: double.infinity,
              height: 430,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Text(
                  'Consistency Is',
                  style: GoogleFonts.poppins(
                    color: AppColors.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  'The Key To Progress.',
                  style: GoogleFonts.poppins(
                    color: AppColors.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Text(
                  "Don't Give Up!",
                  style: GoogleFonts.poppins(
                    color: AppColors.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Fixed height removed here
            Container(
              width: 393,
              decoration: const BoxDecoration(color: AppColors.secondaryLight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.textOnLight,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'sed do eiusmod tempor incididunt ut labore et dolore',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.textOnLight,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      'magna aliqua',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.textOnLight,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            const SizedBox(height: 30),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Material(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(100),
                  child: InkWell(
                    onTap: () {
                      ref.read(userProvider.notifier).setCurrentUser();
                      print('>>> NAVIGATING TO GENDER');
                      print('SETUP USER: ${ref.read(userProvider).user}');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SetUpGender(),
                        ),
                      );
                    },
                    splashColor: AppColors.primary,
                    highlightColor: AppColors.primary,
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      width: 171,
                      height: 44,
                      child: Center(
                        child: Text(
                          'Next',
                          style: GoogleFonts.poppins(
                            color: AppColors.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
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
      ),
    );
  }
}
