import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:mi_store/controllers/auth_controller.dart';

class SigninProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _recoveryEmailController =
      TextEditingController();

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
              password: _passwordController.text)
          .then((value) {
        clearTextFields();
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
            msg: "Password reset email sent",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
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
