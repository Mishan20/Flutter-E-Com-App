// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mi_store/controllers/auth_controller.dart';
import 'package:mi_store/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../utils/custom_dialog.dart';

class SignUpProvider extends ChangeNotifier {
  final AuthController _authController = AuthController();
  User? _user;
  User? get user => _user;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  TextEditingController get nameController => _nameController;

  Future<void> signUpUser(BuildContext context) async {
    CustomDialog.show(context);
    if (_emailController.text.isEmpty) {
      Logger().e("Email is empty");
    } else if (_passwordController.text.isEmpty) {
      Logger().e("Password is empty");
    } else if (_nameController.text.isEmpty) {
      Logger().e("Name is empty");
    } else if (_confirmPasswordController.text.isEmpty) {
      Logger().e("Confirm Password is empty");
    } else if (_passwordController.text != _confirmPasswordController.text) {
      Logger().e("Passwords don't match");
    } else {
      AuthController()
          .createUserAccount(
        emailAddress: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
      )
          .then((value) {
        clearTextFields();
        CustomDialog.toast(context, "User Signed Up");
        CustomDialog.dismiss(context);
      });
    }
  }

  void clearTextFields() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final userCredential = await _authController.signInWithGoogle();
      if (userCredential != null) {
        Logger().i("Google Sign-In Successful: ${userCredential.user?.email}");
      } else {
        Logger().e("Google Sign-In Failed");
      }
    } catch (e) {
      Logger().e("Google Sign-In Error: $e");
    }
  }
}
