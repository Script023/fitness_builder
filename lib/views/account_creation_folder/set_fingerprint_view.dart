import 'package:fitness_builder/set_Up/set_up.dart';
import 'package:fitness_builder/theme/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';

class SetFingerprintView extends StatefulWidget {
  const SetFingerprintView({super.key});

  @override
  State<SetFingerprintView> createState() => _SetFingerprintViewState();
}

class _SetFingerprintViewState extends State<SetFingerprintView> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticating = false;

  Future<bool> _authenticateUser() async {
    if (_isAuthenticating) {  
      return false;
    }

    setState(() {
      _isAuthenticating = true;
    });

    try {
      final isSupported = await auth.isDeviceSupported();

      if (!isSupported) {
        return false;
      }

      final didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to continue',
        biometricOnly: true,
      );

      return didAuthenticate;
    } catch (e) {
      debugPrint('Biometric authentication error: $e');
      return false;
    } finally {
      if (mounted) {
        setState(() {
          _isAuthenticating = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text(
          'Set Your Fingerprint',
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
              },
              icon: const Icon(
                Icons.arrow_left,
                color: AppColors.primary,
                size: 36,
              ),
            );
          },
        ),
      ),
      // Fixes the RenderFlex Overflow by making layout scrollable
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                padding: const EdgeInsets.symmetric(horizontal: 50),
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
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.secondaryLight,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Fixed: Added onTap trigger execution parameter logic here
                      // Replace your old biometric container block with this code:
                      Container(
                        width: double.infinity,
                        height: 303,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryLight,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Opacity(
                                opacity: _isAuthenticating ? 0.3 : 1.0,
                                child: Image.asset(
                                  'assets/images/Mark.png',
                                  width: 182.1,
                                  height: 235.07,
                                  cacheWidth:
                                      364, // Fixes the main thread lag/skipped frames
                                  fit: BoxFit.cover,
                                ),
                              ),
                              if (_isAuthenticating)
                                const SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.primary,
                                    ),
                                    strokeWidth: 5,
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
              const SizedBox(height: 50),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Material(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(100),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SetUpScreen(),
                        ),
                      );
                    },
                    splashColor: AppColors.primary,
                    highlightColor: AppColors.primary,
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      width: 211,
                      height: 44,
                      child: Center(
                        child: Text(
                          'Skip',
                          style: GoogleFonts.poppins(
                            color: AppColors.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight
                                .w800, // Fixed: Changed initialization
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Material(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(100),
                  child: InkWell(
                    onTap: () async {
                      final authenticated = await _authenticateUser();

                      if (!context.mounted) return;

                      if (authenticated) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SetUpScreen(),
                          ),
                        );
                      }
                    },
                    splashColor: AppColors.primary,
                    highlightColor: AppColors.primary,
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      width: 211,
                      height: 44,
                      child: Center(
                        child: Text(
                          'Continue',
                          style: GoogleFonts.poppins(
                            color: AppColors.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight
                                .w800, // Fixed: Changed initialization
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
