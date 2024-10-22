import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mi_store/utils/navigator_utils.dart';

import '../screens/auth/signup_page.dart';
import '../screens/home/homepage.dart';

class AuthController {
//Check Current User Auth State
  static Future<void> checkAuthState(BuildContext context) async {
    Future.delayed(const Duration(seconds: 5), () {
      FirebaseAuth.instance.userChanges().listen((User? user) {
        if (user == null) {
          Logger().e('User is currently signed out!');
          // ignore: use_build_context_synchronously
          CustomNavigator.goTo(context, const SignupPage());
        } else {
          Logger().i('User is signed in!');
          // ignore: use_build_context_synchronously
          CustomNavigator.goTo(context, const HomePage());
        }
      });
    });
  }

  //Create Use Account with Email and Password
  static Future<void> createUserAccount(
      {required String emailAddress, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Logger().e('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
         Logger().e('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        Logger().e('The email address is badly formatted.');
      }else if (e.code == 'operation-not-allowed') {
        Logger().e('Email & Password accounts are not enabled.');
      }
    } catch (e) {
       Logger().e(e);
    }
  }
}
