import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../models/user_model.dart';

class AuthController {
  // Sign Out User
  static Future<void> signOutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Logger().i('User Signed Out');
    } catch (e) {
      Logger().e(e);
    }
  }

  // Sign In User Account
  static Future<void> signInToAccount(
      {required String emailAddress, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Logger().e('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Logger().e('Wrong password provided for that user.');
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  //Create Use Account with Email and Password
  Future<void> createUserAccount(
      {required String emailAddress,
      required String password,
      required String name}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) {
        addUser(value.user!.uid, name, emailAddress);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Logger().e('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Logger().e('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        Logger().e('The email address is badly formatted.');
      } else if (e.code == 'operation-not-allowed') {
        Logger().e('Email & Password accounts are not enabled.');
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  // send Password Reset Email
  static Future<void> sendPasswordResetEmail(
      {required String emailAddress}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
      Logger().i('Password Reset Email Sent');
    } catch (e) {
      Logger().e(e);
    }
  }

  // Save USer Data

  CollectionReference users = FirebaseFirestore.instance.collection("Users");
  Future<void> addUser(String uid, String name, String email) {
    return users.doc(uid).set({
      "name": name,
      "userImage": "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
      "uid": uid,
      "email": email,
    }).then((value) {
      Logger().i("User Added");
    }).catchError((e) {
      Logger().e(e);
    });
  }

  //fetch user data
  Future<UserModel?> getUserData(String uid) async {
    try {
      DocumentSnapshot userData = await users.doc(uid).get();
      return UserModel.fromMap(userData.data() as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  // Update Profile
  Future<void> updateProfile(String uid, String name) async {
    try {
      users.doc(uid).update({"name": name});
    } catch (e) {
      Logger().e(e);
    }
  }
}
