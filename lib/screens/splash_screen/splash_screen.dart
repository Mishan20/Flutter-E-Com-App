import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/web.dart';
import 'package:mi_store/controllers/auth_controller.dart';
import 'package:mi_store/screens/auth/signup_page.dart';
import 'package:mi_store/screens/home/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controller for 4 seconds
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    // Rotate the image
    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Text color transition from black to blue
    _colorAnimation = ColorTween(begin: Colors.black87, end: Colors.blueAccent)
        .animate(_controller);

    // Start the animation
    _controller.forward();

    // After animation ends, redirect to SigninPage
    AuthController.checkAuthState(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient decoration
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // BMW logo with rotation animation
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _rotationAnimation.value * 6.28, // Full circle
                      child: Image.asset(
                        "assets/images/splash/splash.png",
                        width: size.width * 0.5,
                        height: size.width * 0.5,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                // BMW Cars text with color animation
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Text(
                      "BMW Cars",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: _colorAnimation.value,
                        letterSpacing: 1.2,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Activity Indicator with extra padding
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: CupertinoActivityIndicator(radius: 20),
            ),
          ),
        ],
      ),
    );
  }
}
