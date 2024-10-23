import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mi_store/controllers/auth_controller.dart';

class SignUpProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  Future<void> signUpUser(BuildContext context) async {
    if (_emailController.text.isEmpty) {
      Logger().e("Email is empty");
    } else if (_passwordController.text.isEmpty) {
      Logger().e("Password is empty");
    } else if (_confirmPasswordController.text.isEmpty) {
      Logger().e("Confirm Password is empty");
    } else if (_passwordController.text != _confirmPasswordController.text) {
      Logger().e("Passwords don't match");
    } else {
      AuthController.createUserAccount(
          emailAddress: _emailController.text,
          password: _passwordController.text);
    }
  }
}
