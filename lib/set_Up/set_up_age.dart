import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_builder/theme/app_colors.dart';
import 'set_up_weight.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_builder/providers/user_provider.dart';

class SetUpAge extends ConsumerStatefulWidget {
  const SetUpAge({super.key});

  @override
  ConsumerState<SetUpAge> createState() => _SetUpAgeState();
}

class _SetUpAgeState extends ConsumerState<SetUpAge> {
  final FixedExtentScrollController controller = FixedExtentScrollController(
    initialItem: 27,
  );
  @override
  Widget build(BuildContext context) {
    final selectedAge = ref.watch(userProvider).user?.age ?? 28;
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
          child: Column(
            children: [
              const SizedBox(height: 36),
              Center(
                child: Text(
                  'How Old Are You?',
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
              const SizedBox(height: 87),

              // Selected age display
              Text(
                '$selectedAge',
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 33),

              // Yellow indicator arrow
              SvgPicture.asset(
                'assets/images/arrow_icon.svg',
                width: 46,
                height: 32,
              ),
              const SizedBox(height: 23),
              SizedBox(
                height: 120,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(height: 95, color: AppColors.secondaryLight),

                    Positioned.fill(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // two containers in between
                          Container(width: 2, color: AppColors.textPrimary),
                          const SizedBox(width: 80),
                          Container(width: 2, color: AppColors.textPrimary),
                        ],
                      ),
                    ),

                    RotatedBox(
                      quarterTurns: 3,
                      child: ListWheelScrollView.useDelegate(
                        controller: controller,
                        itemExtent: 90,
                        diameterRatio: 100,
                        perspective: 0.0001,
                        physics: const FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (index) {
                          ref.read(userProvider.notifier).setAge(index + 1);
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 100,
                          builder: (context, index) {
                            bool selected = selectedAge == index + 1;

                            return RotatedBox(
                              quarterTurns: 1,
                              child: Center(
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                    color: selected
                                        ? AppColors.textPrimary
                                        : AppColors.textOnLight,
                                    fontSize: selected ? 30 : 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 193),

              // Continue Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Material(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(100),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SetUpWeight(),
                          ),
                        );
                      },
                      splashColor: AppColors.primary,
                      highlightColor: AppColors.primary,
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
    );
  }
}
