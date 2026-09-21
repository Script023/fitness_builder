import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_builder/theme/app_colors.dart';
import 'package:fitness_builder/widget/home_widgets/header_widgets.dart';
import 'package:fitness_builder/widget/home_widgets/category_item_widgets.dart';
import 'package:fitness_builder/widget/home_widgets/category_divider_widgets.dart';
import 'package:fitness_builder/widget/home_widgets/recommendation_widgets.dart';
import 'package:fitness_builder/widget/home_widgets/weekly_challenge_widgets.dart';
import 'package:fitness_builder/widget/home_widgets/article_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageView extends ConsumerStatefulWidget {
  const HomePageView({super.key});

  @override
  ConsumerState<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends ConsumerState<HomePageView> {
  @override
  Widget build(BuildContext context) {
    print('>>> HOMEPAGE BUILDING');
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              HeaderWidget(),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryItemWidget(
                    title: 'Workout',
                    svgpath: 'assets/images/dumbell.svg',
                  ),

                  CategoryDividerWidget(),

                  CategoryItemWidget(
                    title: "Progress\nTracking",
                    svgpath: 'assets/images/book.svg',
                  ),

                  CategoryDividerWidget(),

                  CategoryItemWidget(
                    title: 'Nutrition',
                    svgpath: 'assets/images/apple.svg',
                  ),

                  CategoryDividerWidget(),

                  CategoryItemWidget(
                    title: 'Community',
                    svgpath: 'assets/images/communityguys.svg',
                  ),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Recommendations',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      // do something
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(left: 8.0),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'See All',
                          style: GoogleFonts.leagueSpartan(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: AppColors.primary,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: RecommendationWidget(
                      imagePath: 'assets/images/squatWomen.png',
                      title: 'Squat Exercise',
                      timetitle: '12 Minutes',
                      caloriestitle: '120 Kcal',
                    ),
                  ),

                  Expanded(
                    child: RecommendationWidget(
                      imagePath: 'assets/images/stretchLeg.png',
                      title: 'Full Body Stretching',
                      timetitle: '12 Minutes',
                      caloriestitle: '120 Kcal',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              WeeklyChallengeWidget(),

              Transform.translate(
                offset: Offset(10, 10),
                child: Text(
                  'Articles & Tips',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ArticleWidget(
                      imagePath: 'assets/images/womanwithsinglet.png',
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ArticleWidget(
                      imagePath: 'assets/images/manisgyming.png',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
