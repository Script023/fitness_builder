import 'package:fitness_builder/home_page/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_builder/theme/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_builder/providers/user_provider.dart';

class SetUpProfile extends ConsumerStatefulWidget {
  const SetUpProfile({super.key});

  @override
  ConsumerState<SetUpProfile> createState() => _SetUpProfileState();
}

class _SetUpProfileState extends ConsumerState<SetUpProfile> {
  late final TextEditingController _nicknameController;
  late final TextEditingController _emailController;
  late final TextEditingController _mobileNumberController;
  final formKey = GlobalKey<FormState>();
  bool _isEmailEditable = false;
  bool _isMobileEditable = false;

  @override
  void initState() {
    super.initState();

    final user = ref.read(userProvider).user;

    _nicknameController = TextEditingController(text: user?.nickname ?? '');

    _emailController = TextEditingController(text: user?.email ?? '');

    _mobileNumberController = TextEditingController(
      text: user?.mobileNumber ?? '',
    );

    _isEmailEditable = user?.email?.isEmpty ?? true;
    _isMobileEditable = user?.mobileNumber?.isEmpty ?? true;
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    _emailController.dispose();
    _mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('>>> SETUP PROFILE BUILDING');
    print('>>> PROFILE SCREEN BUILT');
    final user = ref.watch(userProvider.select((state) => state.user));
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
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 36),
                Text(
                  'Fill Your Profile',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: AppColors.textPrimary,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 30),
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
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 143,
                  decoration: BoxDecoration(color: AppColors.secondaryLight),
                  child: Center(
                    child: Stack(
                      children: [
                        // The main circular profile image
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                            'https://picsum.photos/400/600',
                          ),
                        ),
                        // The overlapping edit button positioned at the bottom right
                        Positioned(
                          bottom: 10,
                          right: 4,
                          child: SvgPicture.asset(
                            'assets/images/Frame 85.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 42),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Full name',
                      style: TextStyle(
                        color: AppColors.secondaryLight,
                        fontSize: 12,
                        fontWeight: FontWeight(500),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.textPrimary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          user?.fullName ?? '',
                          style: TextStyle(
                            color: AppColors.textOnLight,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text(
                      'Nickname',
                      style: TextStyle(
                        color: AppColors.secondaryLight,
                        fontSize: 12,
                        fontWeight: FontWeight(500),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: SizedBox(
                    height: 45,
                    child: TextFormField(
                      controller: _nicknameController,
                      onChanged: (value) {
                        ref.read(userProvider.notifier).setNickname(value);
                      },
                      // Text the user types
                      style: TextStyle(
                        color: AppColors.textOnLight,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),

                      // Blinking cursor
                      cursorColor: AppColors.textOnLight,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a nickname';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.textPrimary,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Enter your nickname',
                        hintStyle: TextStyle(
                          color: AppColors.textOnLight.withValues(alpha: 0.5),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: AppColors.secondaryLight,
                        fontSize: 12,
                        fontWeight: FontWeight(500),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                // collection if spread operator
                if (!_isEmailEditable) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.textPrimary,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          user?.email ?? '',
                          style: TextStyle(
                            color: AppColors.textOnLight,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        // child of textfield
                      ),
                    ),
                  ),
                ] else ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: SizedBox(
                      height: 45,
                      child: TextFormField(
                        controller: _emailController,
                        onChanged: (value) {
                          ref.read(userProvider.notifier).setEmail(value);
                        },
                        // Text the user types
                        style: TextStyle(
                          color: AppColors.textOnLight,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),

                        // Blinking cursor
                        cursorColor: AppColors.textOnLight,
                        validator: (value) {
                          final emailRegex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          );

                          final input = value?.trim() ?? '';
                          final isValidEmail = emailRegex.hasMatch(input);
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          if (!(isValidEmail)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.textPrimary,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(
                            color: AppColors.textOnLight.withValues(alpha: 0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text(
                      'Mobile Number',
                      style: TextStyle(
                        color: AppColors.secondaryLight,
                        fontSize: 12,
                        fontWeight: FontWeight(500),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                // collection if spread operator
                if (!_isMobileEditable) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.textPrimary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            user?.mobileNumber ?? '',
                            style: TextStyle(
                              color: AppColors.textOnLight,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // child of textfield
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: SizedBox(
                      height: 45,
                      child: TextFormField(
                        controller: _mobileNumberController,
                        onChanged: (value) {
                          ref.read(userProvider.notifier).setMobile(value);
                        },
                        // Text the user types
                        style: TextStyle(
                          color: AppColors.textOnLight,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),

                        // Blinking cursor
                        cursorColor: AppColors.textOnLight,
                        validator: (value) {
                          final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
                          final input = value?.trim() ?? '';
                          final isValidPhone = phoneRegex.hasMatch(input);
                          if (value == null || value.isEmpty) {
                            return 'Please enter a number';
                          }
                          if (!(isValidPhone)) {
                            return 'Please enter a valid mobile number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.textPrimary,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Enter your mobile number',
                          hintStyle: TextStyle(
                            color: AppColors.textOnLight.withValues(alpha: 0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                SizedBox(height: 28),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(63.79),
                    child: Material(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(63.79),
                      child: InkWell(
                        splashColor: AppColors.primary,
                        highlightColor: AppColors.primary,
                        borderRadius: BorderRadius.circular(63.79),
                        onTap: () {
                          //form validation
                          if (formKey.currentState!.validate()) {
                            final profileComplete = ref
                                .read(userProvider.notifier)
                                .isProfileComplete();
                            if (profileComplete) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePageView(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('profile incomplete')),
                              );
                            }
                          }
                        },
                        child: SizedBox(
                          height: 47,
                          child: Center(
                            child: Text(
                              "Start",
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textOnLight,
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
