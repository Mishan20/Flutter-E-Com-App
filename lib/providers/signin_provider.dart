// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:mi_store/controllers/auth_controller.dart';

import '../utils/custom_dialog.dart';

class SigninProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _recoveryEmailController =
      TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get recoveryEmailController => _recoveryEmailController;

  Future<void> signInUser(BuildContext context) async {
     CustomDialog.show(context);
    if (_emailController.text.isEmpty) {
      Logger().e("Email is empty");
    } else if (_passwordController.text.isEmpty) {
      Logger().e("Password is empty");
    } else {
      AuthController.signInToAccount(
              emailAddress: _emailController.text,
              password: _passwordController.text)
          .then((value) {
        clearTextFields();
        CustomDialog.toast(context, "User Signed In");
        CustomDialog.dismiss(context);
      });
    }
  }

  //forgot password
  Future<void> sendPasswordResetEmail(BuildContext context) async {
    if (_recoveryEmailController.text.isEmpty) {
      Logger().e("Email is empty");
    } else {
      AuthController.sendPasswordResetEmail(
        emailAddress: _recoveryEmailController.text,
      ).then((value) {
        clearTextFields();
        Fluttertoast.showToast(
            msg: "Password Reset Email Sent",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            webPosition: "center",
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      });
    }
  }

  void clearTextFields() {
    _emailController.clear();
    _passwordController.clear();
    _recoveryEmailController.clear();
  }
}
