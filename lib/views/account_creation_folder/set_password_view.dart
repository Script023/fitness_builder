import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_builder/theme/app_colors.dart';

class SetPasswordView extends StatefulWidget {
  const SetPasswordView({super.key});

  @override
  State<SetPasswordView> createState() => _SetPasswordViewState();
}

class _SetPasswordViewState extends State<SetPasswordView> {
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    passwordController = TextEditingController();

    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();

    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Set Password',
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
                // do something here
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
                const SizedBox(height: 60),

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
                SizedBox(height: 37),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColors.secondaryLight),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
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
                              color: AppColors.textOnLight.withValues(alpha: 0.5),
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
                      SizedBox(height: 19),
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
                              color: AppColors.textOnLight.withValues(alpha: 0.5),
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
                SizedBox(height: 50),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Material(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(100),
                    child: InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          print('Password: ${passwordController.text}');
                        }
                        // do something here
                      },
                      splashColor: AppColors.primary,
                      highlightColor: AppColors.primary,
                      child: SizedBox(
                        width: 191.44,
                        height: 44,
                        child: Center(
                          child: Text(
                            'Reset Password',
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
      ),
    );
  }
}
