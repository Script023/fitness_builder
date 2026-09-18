import 'package:fitness_builder/models/weight.dart';
import 'package:fitness_builder/set_Up/set_up_height.dart';
import 'package:fitness_builder/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_builder/widget/created_widgets/static_ruler_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_builder/providers/user_provider.dart';

class SetUpWeight extends ConsumerStatefulWidget {
  const SetUpWeight({super.key});

  @override
  ConsumerState<SetUpWeight> createState() => _SetUpWeightState();
}

class _SetUpWeightState extends ConsumerState<SetUpWeight> {
  final FixedExtentScrollController controller = FixedExtentScrollController(
    initialItem: 27,
  );

  @override
  Widget build(BuildContext context) {
    final weight = ref.watch(userProvider).user?.weight;
    final canContinue = weight != null;
    final selectedWeight = weight?.value;
    final selectedUnit = weight?.unit == WeightUnit.kg ? 'kg' : 'lb';
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
                  'What Is Your Weight?',
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
              SizedBox(height: 57),
              Container(
                width: 323,
                height: 58,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 47),
                      child: InkWell(
                        onTap: () {
                          ref
                              .read(userProvider.notifier)
                              .setWeightUnit(WeightUnit.kg);
                        },
                        child: Text(
                          'KG',
                          style: GoogleFonts.poppins(
                            color: AppColors.textOnLight,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 2,
                      height: 40,
                      color: AppColors.background,
                    ),
                    SizedBox(width: 90),
                    InkWell(
                      onTap: () {
                        ref
                            .read(userProvider.notifier)
                            .setWeightUnit(WeightUnit.lb);
                      },
                      child: Text(
                        'LB',
                        style: GoogleFonts.poppins(
                          color: AppColors.textOnLight,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 53),
              SizedBox(
                height: 100,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(height: 95, color: AppColors.background),

                    RotatedBox(
                      quarterTurns: 3,
                      child: ListWheelScrollView.useDelegate(
                        controller: controller,
                        itemExtent: 90,
                        diameterRatio: 100,
                        perspective: 0.0001,
                        physics: const FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (index) {
                          ref
                              .read(userProvider.notifier)
                              .setWeightValue(index + 1);
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 200,
                          builder: (context, index) {
                            bool selected = weight?.value == index + 1;

                            return RotatedBox(
                              quarterTurns: 1,
                              child: Center(
                                child: Text(
                                  "${index + 1}",
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

              Container(
                width: 391,
                height: 87,
                decoration: const BoxDecoration(
                  color: AppColors.secondaryLight,
                ),
                child: const StaticRuler(),
              ),
              SizedBox(height: 16),
              // Yellow indicator arrow
              SvgPicture.asset(
                'assets/images/arrow_icon.svg',
                width: 46,
                height: 32,
              ),
              // Selected age display
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  SizedBox(width: 145),
                  Text(
                    '$selectedWeight',
                    style: GoogleFonts.poppins(
                      color: AppColors.textPrimary,
                      fontSize: 64,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    selectedUnit,
                    style: GoogleFonts.poppins(
                      color: AppColors.inactive,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
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
                        if (!canContinue) {
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SetUpHeight(),
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
