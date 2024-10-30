import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mi_store/providers/signin_provider.dart';
import 'package:mi_store/providers/signup_provider.dart';
import 'package:mi_store/screens/auth/forgot_password.dart';
import 'package:provider/provider.dart';

import '../../components/custom_buttons/custom_button1.dart';
import '../../components/custom_text/custom_poppins_text.dart';
import '../../components/custom_textFiled/custom_textfield.dart';
import 'signup_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              // Background Image
              Container(
                width: size.width,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(
                        "assets/images/background/bmw-cars-background.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        // ignore: deprecated_member_use
                        Colors.black.withOpacity(0.5),
                        BlendMode.darken),
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomPoppinsText(
                        text: "BMW MI Store",
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      CustomPoppinsText(
                        text: "Sign in to your account",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              // Sign-In form container
              Positioned(
                top: size.height * 0.26,
                child: Container(
                  width: size.width,
                  height: size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Consumer<SigninProvider>(
                          builder: (context, value, child) {
                        return ListView(
                          children: [
                            // Email TextField
                            CustomTextField(
                              controller: value.emailController,
                              text: 'Email',
                              prefixIcon: Icons.email,
                            ),
                            // Password TextField
                            CustomTextField(
                              controller: value.passwordController,
                              text: 'Password',
                              isPassword: true,
                              prefixIcon: Icons.password,
                            ),
                            // Forgot Password Link
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, CupertinoPageRoute(
                                    builder: (context) {
                                      return const ForgotPassword();
                                    },
                                  ));
                                },
                                child: CustomPoppinsText(
                                  text: "Forgot Password?",
                                  color: Colors.amber.shade800,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Sign In Button
                            CustomButton1(
                              ontap: () {
                                Provider.of<SigninProvider>(context,
                                        listen: false)
                                    .signInUser(context);
                              },
                              size: size,
                              text: 'Sign In',
                              colors: [
                                Colors.amber.shade600,
                                Colors.amber.shade800
                              ],
                            ),
                            // Create New Account Button
                            CustomButton1(
                              ontap: () {
                                Navigator.push(context, CupertinoPageRoute(
                                  builder: (context) {
                                    return const SignupPage();
                                  },
                                ));
                              },
                              size: size,
                              text: 'Create New Account',
                              colors: [
                                Colors.grey.shade600,
                                Colors.grey.shade800
                              ],
                            ),
                            const SizedBox(height: 20),
                            // Social Login Section
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomPoppinsText(
                                  text: "Or sign in with",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade600,
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            // Social Media Icons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Google
                                GestureDetector(
                                  onTap: () {
                                    Provider.of<SignUpProvider>(context,
                                            listen: false)
                                        .signInWithGoogle(context);
                                  },
                                  child: const FaIcon(
                                    FontAwesomeIcons.google,
                                    size: 40,
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(width: 30),
                                // Facebook
                                GestureDetector(
                                  onTap: () {
                                    // Add Facebook login functionality here
                                  },
                                  child: const FaIcon(
                                    FontAwesomeIcons.facebook,
                                    size: 40,
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(width: 30),
                                // GitHub
                                GestureDetector(
                                  onTap: () {
                                    // Add GitHub login functionality here
                                  },
                                  child: const FaIcon(
                                    FontAwesomeIcons.github,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      })),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
