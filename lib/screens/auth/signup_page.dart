import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mi_store/providers/signup_provider.dart';
import 'package:provider/provider.dart';

import '../../components/custom_buttons/custom_button1.dart';
import '../../components/custom_text/custom_poppins_text.dart';
import '../../components/custom_textFiled/custom_textfield.dart';
import 'signin_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
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
                          text: "Create new user account",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                // Sign-Up Form Container
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
                        child: Consumer<SignUpProvider>(
                            builder: (context, value, child) {
                          return ListView(
                            children: [
                              // Email TextField
                              CustomTextField(
                                controller: value.emailController,
                                text: 'Email',
                                prefixIcon: Icons.email,
                              ),
                              // Name TextField
                              CustomTextField(
                                controller: value.nameController,
                                text: 'Name',
                                prefixIcon: Icons.person,
                              ),
                              // Password TextField
                              CustomTextField(
                                controller: value.passwordController,
                                text: 'Password',
                                isPassword: true,
                                prefixIcon: Icons.password,
                              ),
                              // Confirm Password TextField
                              CustomTextField(
                                controller: value.confirmPasswordController,
                                text: 'Confirm Password',
                                isPassword: true,
                                prefixIcon: Icons.password,
                              ),
                              const SizedBox(height: 10),
                              // Sign-Up Button
                              CustomButton1(
                                ontap: () {
                                  Provider.of<SignUpProvider>(context,
                                          listen: false)
                                      .signUpUser(context);
                                },
                                size: size,
                                text: 'Create Account',
                                colors: [
                                  Colors.amber.shade600,
                                  Colors.amber.shade800
                                ],
                              ),
                              // Sign-In Button
                              CustomButton1(
                                ontap: () {
                                  Navigator.push(context, CupertinoPageRoute(
                                    builder: (context) {
                                      return const SigninPage();
                                    },
                                  ));
                                },
                                size: size,
                                text: 'Sign In',
                                colors: [
                                  Colors.grey.shade600,
                                  Colors.grey.shade800
                                ],
                              ),
                              const SizedBox(height: 20),
                              // Social Sign-Up Text
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomPoppinsText(
                                    text: "Or sign up with",
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
                                      // Add Google sign-up functionality here
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
                                      // Add Facebook sign-up functionality here
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
                                      // Add GitHub sign-up functionality here
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
      ),
    );
  }
}
