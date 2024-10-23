import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mi_store/controllers/auth_controller.dart';

class SigninProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _recoveryEmailController = TextEditingController();


  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get recoveryEmailController => _recoveryEmailController;

  Future<void> signInUser(BuildContext context) async {
    if (_emailController.text.isEmpty) {
      Logger().e("Email is empty");
    } else if (_passwordController.text.isEmpty) {
      Logger().e("Password is empty");
    } else {
      AuthController.signInToAccount(
          emailAddress: _emailController.text,
          password: _passwordController.text);
    }
  }

  //forgot password
  Future<void> sendPasswordResetEmail(BuildContext context) async {
  if (_recoveryEmailController.text.isEmpty) {
    Logger().e("Email is empty");
  } else {
    AuthController.sendPasswordResetEmail(
        emailAddress: _recoveryEmailController.text);
  }
}
}

