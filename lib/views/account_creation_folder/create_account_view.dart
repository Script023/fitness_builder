import 'package:fitness_builder/theme/app_colors.dart';
import 'package:fitness_builder/providers/auth_provider.dart';
import 'package:fitness_builder/views/account_creation_folder/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_builder/views/account_creation_folder/set_fingerprint_view.dart';
import 'package:fitness_builder/set_Up/set_up.dart';
import 'package:fitness_builder/providers/auth_state.dart';
class CreateAccountScreen extends ConsumerStatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  ConsumerState<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  //Track the pressed state
  bool _isPressed1 = false;
  bool _isPressed2 = false;
  bool _isPressed3 = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  late final TextEditingController identifierController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController fullnameController;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    identifierController = TextEditingController();
    passwordController = TextEditingController();
    fullnameController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    identifierController.dispose();
    passwordController.dispose();
    fullnameController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, (previous, next) {
      print('>>> NAVIGATING TO SETUP');
      if (next.status == AuthStatus.authenticated) {
        print('AUTHENTICATED - GOING TO SETUP');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SetUpScreen()),
        );
      }

      if (next.status == AuthStatus.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage ?? 'account creation failed')),
        );
      }
    });
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text(
          'Create Account',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: AppColors.primary,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                // do smething here like go back to previous screen
              },
              icon: Icon(Icons.arrow_left, color: AppColors.primary),
            );
          },
        ),
      ),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 5),
                Center(
                  child: Text(
                    "Let's Start!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColors.secondaryLight),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Text(
                            'Full name',
                            style: TextStyle(
                              color: AppColors.textOnLight,
                              fontSize: 12,
                              fontWeight: FontWeight(500),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: TextFormField(
                          controller: fullnameController,

                          // Text the user types
                          style: TextStyle(
                            color: AppColors.textOnLight,
                            fontSize: 14,
                          ),

                          // Blinking cursor
                          cursorColor: AppColors.textOnLight,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your name';
                            }

                            if (!RegExp(
                              r"^[a-zA-Z\s'-]+$",
                            ).hasMatch(value.trim())) {
                              return 'Name can only contain letters, spaces, hyphens, and apostrophes';
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
                            hintText: 'fullname',
                            hintStyle: TextStyle(
                              color: AppColors.textOnLight.withValues(
                                alpha: 0.5,
                              ),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Text(
                            'Email or Mobile Number',
                            style: TextStyle(
                              color: AppColors.textOnLight,
                              fontSize: 12,
                              fontWeight: FontWeight(500),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: TextFormField(
                          controller: identifierController,

                          // Text the user types
                          style: TextStyle(
                            color: AppColors.textOnLight,
                            fontSize: 14,
                          ),

                          // Blinking cursor
                          cursorColor: AppColors.textOnLight,
                          validator: (value) {
                            final emailRegex = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                            );

                            final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
                            final input = value?.trim() ?? '';
                            final isValidEmail = emailRegex.hasMatch(input);
                            final isValidPhone = phoneRegex.hasMatch(input);
                            if (!(isValidEmail || isValidPhone)) {
                              return 'Please enter a valid email or phone number';
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
                            hintText: 'Email or phone number',
                            hintStyle: TextStyle(
                              color: AppColors.textOnLight.withValues(
                                alpha: 0.5,
                              ),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Text(
                            'Password',
                            style: TextStyle(
                              color: AppColors.textOnLight,
                              fontSize: 12,
                              fontWeight: FontWeight(500),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: TextFormField(
                          controller: passwordController,

                          // Text the user types
                          style: TextStyle(
                            color: AppColors.textOnLight,
                            fontSize: 14,
                          ),

                          // Blinking cursor
                          cursorColor: AppColors.textOnLight,
                          obscureText: _obscurePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }

                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
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
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: AppColors.textOnLight.withValues(
                                alpha: 0.5,
                              ),
                              fontSize: 14,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              color: AppColors.textOnLight,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Text(
                            'Confirm Password',
                            style: TextStyle(
                              color: AppColors.textOnLight,
                              fontSize: 12,
                              fontWeight: FontWeight(500),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: TextFormField(
                          controller: confirmPasswordController,

                          // Text the user types
                          style: TextStyle(
                            color: AppColors.textOnLight,
                            fontSize: 14,
                          ),

                          // Blinking cursor
                          cursorColor: AppColors.textOnLight,
                          obscureText: _obscureConfirmPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }

                            if (value != passwordController.text) {
                              return 'Passwords do not match';
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
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(
                              color: AppColors.textOnLight.withValues(
                                alpha: 0.5,
                              ),
                              fontSize: 14,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword =
                                      !_obscureConfirmPassword;
                                });
                              },
                              icon: Icon(
                                _obscureConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              color: AppColors.textOnLight,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: InkWell(
                    // Triggers underline on touch down
                    onTapDown: (_) => setState(() => _isPressed1 = true),
                    // Removes underline when released or dragged away
                    onTapUp: (_) => setState(() => _isPressed1 = false),
                    onTapCancel: () => setState(() => _isPressed1 = false),
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'By continuing, you agree to',
                          style: GoogleFonts.leagueSpartan(
                            color: AppColors.textPrimary,
                            fontSize: 13,
                            fontWeight: FontWeight(400),
                            decoration: _isPressed1
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            decorationColor: AppColors.primary,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Terms of Use',
                            style: GoogleFonts.leagueSpartan(
                              color: AppColors.primary,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              decoration: _isPressed1
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                              decorationColor: AppColors.primary,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' and',
                                style: GoogleFonts.leagueSpartan(
                                  color: AppColors.textPrimary,
                                  fontSize: 13,
                                  fontWeight: FontWeight(400),
                                  decoration: _isPressed1
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  decorationColor: AppColors.primary,
                                ),
                              ),
                              TextSpan(
                                text: ' Privacy Policy',
                                style: GoogleFonts.leagueSpartan(
                                  color: AppColors.primary,
                                  fontSize: 13,
                                  fontWeight: FontWeight(400),
                                  decoration: _isPressed1
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  decorationColor: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Material(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(100),
                    child: InkWell(
                      onTap: () {
                        // handle sign up later
                        if (formKey.currentState!.validate()) {
                          final fullName = fullnameController.text.trim();
                          final password = passwordController.text.trim();
                          final mobileOrEmail = identifierController.text
                              .trim();
                          ref
                              .read(authProvider.notifier)
                              .createUser(
                                fullName: fullName,
                                password: password,
                                mobileOrEmail: mobileOrEmail,
                              );
                        }
                      },
                      splashColor: AppColors.primary,
                      highlightColor: AppColors.primary,
                      child: SizedBox(
                        width: 178.56,
                        height: 44,
                        child: Center(
                          child: Text(
                            'Sign Up',
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
                SizedBox(height: 10),
                InkWell(
                  // Triggers underline on touch down
                  onTapDown: (_) => setState(() => _isPressed2 = true),
                  // Removes underline when released or dragged away
                  onTapUp: (_) => setState(() => _isPressed2 = false),
                  onTapCancel: () => setState(() => _isPressed2 = false),
                  onTap: () {},
                  child: Text(
                    'or sign up with',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight(300),
                      decorationColor: AppColors.primary,
                      decoration: _isPressed2
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 110),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkResponse(
                        radius: 25,
                        splashColor: Colors.blue.withAlpha(51),
                        highlightColor: Colors.blue.withAlpha(26),
                        onTap: () {
                          //do something here!!!
                        },
                        child: SvgPicture.asset(
                          'assets/images/Google_icon.svg',
                          width: 34,
                          height: 34,
                        ),
                      ),
                      SizedBox(width: 16),
                      InkResponse(
                        radius: 25,
                        splashColor: Colors.blue.withAlpha(51),
                        highlightColor: Colors.blue.withAlpha(26),
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/images/Facebook_icon.svg',
                          width: 34,
                          height: 34,
                        ),
                      ),
                      SizedBox(width: 16),
                      InkResponse(
                        radius: 25,
                        splashColor: Colors.blue.withAlpha(51),
                        highlightColor: Colors.blue.withAlpha(26),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SetFingerprintView(),
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          'assets/images/Fingerprint_icon.svg',
                          width: 34,
                          height: 34,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  // Triggers underline on touch down
                  onTapDown: (_) => setState(() => _isPressed3 = true),
                  // Removes underline when released or dragged away
                  onTapUp: (_) => setState(() => _isPressed3 = false),
                  onTapCancel: () => setState(() => _isPressed3 = false),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginViewScreen(),
                      ),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account?",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight(300),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Log in',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight(300),
                            decoration: _isPressed3
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        ),
                      ],
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
