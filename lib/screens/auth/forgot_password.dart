import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mi_store/providers/signin_provider.dart';
import 'package:provider/provider.dart';

import '../../components/custom_buttons/custom_button1.dart';
import '../../components/custom_text/custom_poppins_text.dart';
import '../../components/custom_textFiled/custom_textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

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
              // Background with BMW image
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
                        text: "Reset your password",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              // Back button
              Positioned(
                top: 40,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              // Form container
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
                      child: Consumer<SigninProvider>(builder: (context, value, child) {
                        return ListView(
                          children: [
                            const CustomPoppinsText(
                              text: "Enter your registered email address",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 20),
                            // Email TextField
                            CustomTextField(
                              controller: value.recoveryEmailController,
                              text: 'Email',
                              prefixIcon: Icons.email,
                            ),
                            const SizedBox(height: 20),
                            // Reset Password Button
                            CustomButton1(
                              ontap: () {
                                Provider.of<SigninProvider>(context, listen: false).sendPasswordResetEmail(context);
                              },
                              size: size,
                              text: 'Reset Password',
                              colors: [
                                Colors.amber.shade600,
                                Colors.amber.shade800
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomPoppinsText(
                                  text: "Remembered your password?",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade600,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: CustomPoppinsText(
                                    text: " Sign In",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.amber.shade800,
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
