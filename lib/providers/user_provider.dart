import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mi_store/controllers/auth_controller.dart';
import 'package:mi_store/providers/profile_provider.dart';
import 'package:mi_store/utils/navigator_utils.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../screens/auth/signup_page.dart';
import '../screens/home/main_screen.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel? get userData => _user;

  //Check Current User Auth State
  Future<void> checkAuthState(BuildContext context) async {
    Future.delayed(const Duration(seconds: 5), () {
      FirebaseAuth.instance.userChanges().listen((User? user) async {
        if (user == null) {
          Logger().e('User is currently signed out!');
          // ignore: use_build_context_synchronously
          CustomNavigator.goTo(context, const SignupPage());
        } else {
          // ignore: use_build_context_synchronously
          fetchData(user.uid, context).then((value) {
            // ignore: use_build_context_synchronously
            CustomNavigator.goTo(context, const MainScreen());
            Logger().i('User is signed in ----> $user');
          });
        }
      });
    });
  }

  Future<void> fetchData(uid, context) async {
    _user = await AuthController().getUserData(uid);
    Provider.of<ProfileProvider>(context, listen: false)
        .serUserName(_user!.name);
    notifyListeners();
  }

  Future<void> updateProfileData(name) async {
    AuthController().updateProfile(_user!.uid, name).then((value) {
      Logger().i("Profile Updated");
    });
  }
}
