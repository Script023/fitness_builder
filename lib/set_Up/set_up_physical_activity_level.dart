import 'package:fitness_builder/models/user_level.dart';
import 'package:fitness_builder/set_Up/set_up_profile.dart';
import 'package:fitness_builder/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_builder/providers/user_provider.dart';

class SetUpPhysicalActivityLevel extends ConsumerStatefulWidget {
  const SetUpPhysicalActivityLevel({super.key});

  @override
  ConsumerState<SetUpPhysicalActivityLevel> createState() =>
      _SetUpPhysicalActivityLevelState();
}

class _SetUpPhysicalActivityLevelState
    extends ConsumerState<SetUpPhysicalActivityLevel> {
  @override
  Widget build(BuildContext context) {
    final userLevel = ref.watch(
      userProvider.select((state) => state.user?.userLevel),
    );
    final isBeginnerSelected = userLevel == UserLevel.beginner;
    final isIntermediateSelected = userLevel == UserLevel.intermediate;
    final isAdvanceSelected = userLevel == UserLevel.advanced;
    final canContinue = userLevel != null;
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 36),
                Center(
                  child: Text(
                    'Physical Activity Level',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: AppColors.textPrimary,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(height: 31),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.leagueSpartan(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'sed do eiusmod tempor incididunt ut labore et dolore',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.leagueSpartan(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'magna aliqua',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.leagueSpartan(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 114),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(38),
                    child: Material(
                      color: AppColors.textPrimary,
                      borderRadius: BorderRadius.circular(38),
                      child: InkWell(
                        splashColor: isBeginnerSelected
                            ? AppColors.primary
                            : Colors.transparent,
                        highlightColor: isBeginnerSelected
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(38),
                        onTap: () {
                          ref
                              .read(userProvider.notifier)
                              .setUserLevel(UserLevel.beginner);
                        },
                        child: SizedBox(
                          height: 64,
                          child: Center(
                            child: Text(
                              'Beginner',
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(38),
                    child: Material(
                      color: AppColors.textPrimary,
                      borderRadius: BorderRadius.circular(38),
                      child: InkWell(
                        splashColor: isIntermediateSelected
                            ? AppColors.primary
                            : Colors.transparent,
                        highlightColor: isIntermediateSelected
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(38),
                        onTap: () {
                          ref
                              .read(userProvider.notifier)
                              .setUserLevel(UserLevel.intermediate);
                        },
                        child: SizedBox(
                          height: 64,
                          child: Center(
                            child: Text(
                              'Intermediate',
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(38),
                    child: Material(
                      color: AppColors.textPrimary,
                      borderRadius: BorderRadius.circular(38),
                      child: InkWell(
                        splashColor: isAdvanceSelected
                            ? AppColors.primary
                            : Colors.transparent,
                        highlightColor: isAdvanceSelected
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(38),
                        onTap: () {
                          ref
                              .read(userProvider.notifier)
                              .setUserLevel(UserLevel.advanced);
                        },
                        child: SizedBox(
                          height: 64,
                          child: Center(
                            child: Text(
                              'Advance',
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 148),
                // Continue Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(38.0),
                    child: Material(
                      color: AppColors.inactive,
                      borderRadius: BorderRadius.circular(38),
                      child: InkWell(
                        splashColor: canContinue
                            ? AppColors.primary
                            : Colors.transparent,
                        highlightColor: canContinue
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(38),
                        onTap: canContinue
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SetUpProfile(),
                                  ),
                                );
                              }
                            : null,
                        child: SizedBox(
                          height: 44,
                          child: Center(
                            child: Text(
                              "Continue",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
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
          ),
        ),
      ),
    );
  }
}
