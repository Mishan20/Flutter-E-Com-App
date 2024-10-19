import 'package:flutter/material.dart';

import '../custom_text/custom_poppins_text.dart';

// ignore: must_be_immutable
class CustomButton1 extends StatelessWidget {
  final String text;
  final List<Color> colors;
  VoidCallback ontap;
  CustomButton1({
    required this.colors,
    required this.text,
    super.key,
    required this.size,
    required this.ontap,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Container(
          width: size.width * 0.85,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 4),
                blurRadius: 6,
              )
            ],
          ),
          child: Center(
            child: CustomPoppinsText(
              text: text,
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
