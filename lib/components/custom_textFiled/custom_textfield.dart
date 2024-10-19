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
  bool isObscure = true; // Default password visibility is hidden

  @override
  void initState() {
    super.initState();
    // Set the initial state of the password visibility
    isObscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword && isObscure,
        decoration: InputDecoration(
          // Add border styling
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.amber, width: 2),
          ),
          // Style for the label
          labelText: widget.text,
          labelStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          // Add a background color for the input field
          filled: true,
          fillColor: Colors.grey.shade100,
          // Prefix Icon
          prefixIcon: Icon(widget.prefixIcon, color: Colors.amber.shade800),
          // Suffix Icon for password visibility toggle
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child: Icon(
                    isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey.shade600,
                  ),
                )
              : null,
          // Add some padding inside the field for user comfort
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
