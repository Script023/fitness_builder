import 'package:fitness_builder/home_page/home_page_view.dart';
import 'package:fitness_builder/providers/auth_provider.dart';
import 'package:fitness_builder/theme/app_colors.dart';
import 'package:fitness_builder/views/account_creation_folder/create_account_view.dart';
import 'package:fitness_builder/views/account_creation_folder/forgot_password_view.dart';
import 'package:fitness_builder/views/account_creation_folder/set_fingerprint_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_builder/providers/auth_state.dart';

class LoginViewScreen extends ConsumerStatefulWidget {
  const LoginViewScreen({super.key});

  @override
  ConsumerState<LoginViewScreen> createState() => _LoginViewScreenState();
}

class _LoginViewScreenState extends ConsumerState<LoginViewScreen> {
  //Track the pressed state
  bool _isPressed1 = false;
  bool _isPressed3 = false;
  bool _obscurePassword = true;
  // textfield controller
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, (previous, next) {
      if (next.status == AuthStatus.authenticated) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePageView()),
        );
      }

      if (next.status == AuthStatus.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage ?? 'Login failed')),
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text(
          'Log In',
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Text(
                    'Welcome',
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
                  padding: EdgeInsets.symmetric(horizontal: 15),
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
                SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColors.secondaryLight),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Username or email',
                            style: TextStyle(
                              color: AppColors.textOnLight,
                              fontSize: 12,
                              fontWeight: FontWeight(500),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: TextFormField(
                          controller: emailController,

                          // Text the user types
                          style: TextStyle(
                            color: AppColors.textOnLight,
                            fontSize: 14,
                          ),

                          // Blinking cursor
                          cursorColor: AppColors.textOnLight,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a valid email';
                            }
                            if (!value.contains('@')) {
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
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: AppColors.textOnLight.withValues(alpha: 0.5),
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
                      SizedBox(height: 10),
                      Align(
                        alignment: AlignmentGeometry.directional(0.8, -0.1),
                        child: InkWell(
                          // Triggers underline on touch down
                          onTapDown: (_) => setState(() => _isPressed1 = true),
                          // Removes underline when released or dragged away
                          onTapUp: (_) => setState(() => _isPressed1 = false),
                          onTapCancel: () =>
                              setState(() => _isPressed1 = false),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordView(),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight(500),
                              decoration: _isPressed1
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                              decorationColor: AppColors.textOnLight,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),

                SizedBox(height: 50),
                //do something here!!
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Material(
                    color: AppColors.inactive,
                    borderRadius: BorderRadius.circular(100),
                    child: InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          final email = emailController.text.trim();
                          final password = passwordController.text;

                          ref
                              .read(authProvider.notifier)
                              .login(email: email, password: password);
                        }
                      },
                      splashColor: AppColors.primary,
                      highlightColor: AppColors.primary,
                      child: SizedBox(
                        width: 178.56,
                        height: 44,
                        child: Center(
                          child: Text(
                            'Log In',
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
                Text(
                  'or sign up with',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight(300),
                    decorationColor: AppColors.primary,
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
                        builder: (context) => const CreateAccountScreen(),
                      ),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight(300),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Sign Up',
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
