import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_store/screens/auth/forgot_password.dart';

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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                        text: "Sign in to your account",
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
                                text: "Forget Password?",
                                color: Colors.amber.shade800,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          CustomButton1(
                            ontap: () {},
                            size: size,
                            text: 'Sign In',
                            colors: [
                              Colors.amber.shade600,
                              Colors.amber.shade800
                            ],
                          ),
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
