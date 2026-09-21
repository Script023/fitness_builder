import 'package:fitness_builder/models/height.dart';
import 'package:fitness_builder/set_Up/set_up_goal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_builder/widget/created_widgets/static_ruler_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitness_builder/theme/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_builder/providers/user_provider.dart';

class SetUpHeight extends ConsumerStatefulWidget {
  const SetUpHeight({super.key});

  @override
  ConsumerState<SetUpHeight> createState() => _SetUpHeightState();
}

class _SetUpHeightState extends ConsumerState<SetUpHeight> {
  final String _selectedUnit = 'Cm';

  late final FixedExtentScrollController controller;

  @override
  void initState() {
    super.initState();
    // this does not store the value of height in userstate but stores it locally
    final height = ref.read(userProvider).user?.height ?? Height(value: 50);
    controller = FixedExtentScrollController(initialItem: height.value - 1);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = ref.watch(
      userProvider.select((state) => state.user?.height ?? Height(value: 50)),
    );
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
                    'What Is Your Height?',
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
                SizedBox(height: 40),
                // Selected height display
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    SizedBox(width: 145),
                    Text(
                      '${height.value}',
                      style: GoogleFonts.poppins(
                        color: AppColors.textPrimary,
                        fontSize: 64,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      _selectedUnit,
                      style: GoogleFonts.poppins(
                        color: AppColors.inactive,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Transform.translate(
                  offset: const Offset(20, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      SizedBox(
                        width: 110,
                        height: 400,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(height: 95, color: Colors.black),

                            RotatedBox(
                              quarterTurns: 0,
                              child: ListWheelScrollView.useDelegate(
                                controller: controller,
                                itemExtent: 90,
                                diameterRatio: 100,
                                perspective: 0.0001,
                                physics: const FixedExtentScrollPhysics(),
                                onSelectedItemChanged: (index) {
                                  ref
                                      .read(userProvider.notifier)
                                      .setHeight(200 - index);
                                },
                                childDelegate: ListWheelChildBuilderDelegate(
                                  childCount: 200,
                                  builder: (context, index) {
                                    bool selected = height.value == 200 - index;

                                    return RotatedBox(
                                      quarterTurns: 0,
                                      child: Center(
                                        child: Text(
                                          "${200 - index}",
                                          style: TextStyle(
                                            color: selected
                                                ? AppColors.textPrimary
                                                : AppColors.inactive,
                                            fontSize: selected ? 40 : 30,
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

                      RotatedBox(
                        quarterTurns: 3,
                        child: Container(
                          width: 380,
                          height: 87,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryLight,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const StaticRuler(),
                        ),
                      ),
                      SizedBox(width: 12),
                      // pokes out past the ruler's right edge
                      RotatedBox(
                        quarterTurns: 3,
                        child: SvgPicture.asset(
                          'assets/images/arrow_icon.svg',
                          width: 46,
                          height: 32,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
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
                              builder: (context) => const SetUpGoal(),
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
      ),
    );
  }
}
