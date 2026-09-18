import 'package:fitness_builder/theme/app_colors.dart';
import 'package:fitness_builder/views/account_creation_folder/set_password_view.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late final TextEditingController identifierController;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    identifierController = TextEditingController();
  }

  @override
  void dispose() {
    identifierController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text(
          'Forgotten Password',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Text(
                    'Forgot Password?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(height: 26),
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
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Text(
                            'Enter your email address or phone number',
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

                            hintText: 'Email or phone number',
                            hintStyle: TextStyle(
                              color: AppColors.textOnLight.withValues(alpha: 0.5),
                              fontSize: 14,
                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                ClipRRect(
                  borderRadius: BorderRadius.circular(38.0),
                  child: Material(
                    color: AppColors.inactive,
                    borderRadius: BorderRadius.circular(38),
                    child: InkWell(
                      splashColor: AppColors.primary,
                      highlightColor: AppColors.primary,
                      borderRadius: BorderRadius.circular(38),
                      onTap: () {
                        Navigator.push(
                          context,
                           MaterialPageRoute(
                            builder: (context)=> const SetPasswordView(),
                            )
                        );
                        if (formKey.currentState!.validate()) {
                          // Later: start password recovery process
                        }
                      },
                      child: SizedBox(
                        width: 178.56,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
