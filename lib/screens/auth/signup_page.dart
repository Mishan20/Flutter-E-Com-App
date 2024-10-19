import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
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
              Container(
                width: size.width,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: const AssetImage(
                      "assets/images/background/bmw-cars-background.jpg"),
                  fit: BoxFit.cover,
                  // ignore: deprecated_member_use
                  colorFilter: ColorFilter.mode(
                      // ignore: deprecated_member_use
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken),
                )),
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
              Positioned(
                  top: size.height * 0.26,
                  child: Container(
                    width: size.width,
                    height: size.height,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView(
                        children: [
                          CustomTextField(
                            controller: _emailController,
                            text: 'Email',
                            prefixIcon: Icons.email,
                          ),
                          CustomTextField(
                            controller: _passwordController,
                            text: 'Password',
                            isPassword: true,
                            prefixIcon: Icons.password,
                          ),
                          CustomTextField(
                            controller: _confirmPasswordController,
                            text: 'Confirm Password',
                            isPassword: true,
                            prefixIcon: Icons.password,
                          ),
                          const SizedBox(height: 10),
                          CustomButton1(
                            ontap: () {},
                            size: size,
                            text: 'Sign Up',
                            colors: [
                              Colors.amber.shade600,
                              Colors.amber.shade800
                            ],
                          ),
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
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
