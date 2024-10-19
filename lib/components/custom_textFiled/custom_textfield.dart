import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  final IconData? prefixIcon;
  final String text;
  bool isPassword;
  CustomTextField({
    required this.text,
    required this.controller,
    this.isPassword = false,
    required this.prefixIcon,
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          controller: widget.controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: Text(widget.text),
            prefixIcon: Icon(widget.prefixIcon),
            suffixIcon: widget.isPassword == true
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: Icon(
                        isObscure ? Icons.visibility_off : Icons.visibility),
                  )
                : null,
          )),
    );
  }
}
