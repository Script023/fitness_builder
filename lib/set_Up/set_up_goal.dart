import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_builder/widget/created_widgets/goal_picker.dart';
import 'package:fitness_builder/set_Up/set_up_physical_activity_level.dart';
import 'package:fitness_builder/theme/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_builder/providers/user_provider.dart';
import 'package:fitness_builder/models/fitness_goal.dart';

class SetUpGoal extends ConsumerStatefulWidget {
  const SetUpGoal({super.key});

  @override
  ConsumerState<SetUpGoal> createState() => _SetUpGoalState();
}

class _SetUpGoalState extends ConsumerState<SetUpGoal> {
  @override
  Widget build(BuildContext context) {
    final goal = ref.watch(userProvider.select((state) => state.user?.goal));
    final selectedGoalIndex = goal != null
        ? FitnessGoal.options.indexOf(goal)
        : null;

    final canContinue = goal != null;

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
                    'What Is Your Goal?',
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
                SizedBox(height: 36),
                Container(
                  width: double.infinity,
                  height: 450,
                  decoration: BoxDecoration(color: const Color(0xFFB3A0FF)),
                  child: Padding(
                    padding: const EdgeInsetsGeometry.symmetric(vertical: 20),
                    child: GoalPicker(
                      options: const [
                        'Lose Weight', // index 0
                        'Gain Weight', // index 1
                        'Muscle Mass Gain', // index 2
                        'Shape Body', // index 3
                        'Others', // index 4
                      ],
                      selectedIndex: selectedGoalIndex,
                      // function responsible for sending the index
                      onChanged: (index) {
                        ref.read(userProvider.notifier).setGoal(index);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 40),
                // Continue Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Material(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(100),
                      child: InkWell(
                        onTap: canContinue
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SetUpPhysicalActivityLevel(),
                                  ),
                                );
                              }
                            : null,
                        splashColor: canContinue
                            ? AppColors.primary
                            : Colors.transparent,
                        highlightColor: canContinue
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                        child: SizedBox(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
