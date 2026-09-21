import 'package:fitness_builder/set_Up/set_up_age.dart';
import 'package:fitness_builder/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_builder/models/gender.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_builder/providers/user_provider.dart';

class SetUpGender extends ConsumerWidget {
  const SetUpGender({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('>>> GENDER SCREEN BUILT');
    final selectedGender = ref.watch(userProvider.select((state)=> state.user?.gender));
    final isMaleSelected = selectedGender == Gender.male;
    final isFemaleSelected = selectedGender == Gender.female;
    final canContinue = selectedGender != null;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        // 1. Give the leading slot enough width for both the icon and text
        leadingWidth: 100,
        // 2. Use leading instead of actions to force it to the far left
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(
              left: 8.0,
            ), // Nudges it slightly from the screen edge
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.arrow_left, color: AppColors.primary, size: 24),
              Text(
                'Back',
                style: GoogleFonts.leagueSpartan(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                "What's Your Gender",
                style: GoogleFonts.poppins(
                  color: AppColors.textPrimary,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 14),
              // Fixed height removed here
              Container(
                width: 393,
                decoration: const BoxDecoration(
                  color: AppColors.secondaryLight,
                ),
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
              SizedBox(height: 46),
              InkResponse(
                radius: 35,
                splashColor: isMaleSelected
                    ? AppColors.primary
                    : Colors.transparent,
                highlightColor: isMaleSelected
                    ? AppColors.primary
                    : Colors.transparent,
                onTap: () {
                  ref.read(userProvider.notifier).setGender(Gender.male);
                },
                child: SvgPicture.asset(
                  'assets/images/gender_male.svg',
                  width: 162.95,
                  height: 162.95,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Male',
                style: GoogleFonts.poppins(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight(800),
                ),
              ),

              SizedBox(height: 19),
              InkResponse(
                radius: 35,
                onTap: () {
                  ref.read(userProvider.notifier).setGender(Gender.female);
                },
                splashColor: isFemaleSelected
                    ? AppColors.primary
                    : Colors.transparent,
                highlightColor: isFemaleSelected
                    ? AppColors.primary
                    : Colors.transparent,
                child: SvgPicture.asset(
                  'assets/images/gender_female.svg',
                  width: 162,
                  height: 162,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Female',
                style: GoogleFonts.poppins(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight(800),
                ),
              ),

              SizedBox(height: 47),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Material(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(100),
                  child: InkWell(
                    onTap: () {
                      if (!canContinue) {
                        return;
                      }
                      print('>>> NAVIGATING TO AGE');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SetUpAge(),
                        ),
                      );
                    },

                    splashColor: canContinue
                        ? AppColors.primary
                        : Colors.transparent,
                    highlightColor: canContinue
                        ? AppColors.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      width: 191.44,
                      height: 44,

                      child: Center(
                        child: Text(
                          'Continue',
                          style: GoogleFonts.poppins(
                            color: AppColors.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight(800),
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
      ),
    );
  }
}
