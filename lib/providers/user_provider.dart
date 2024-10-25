// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:mi_store/controllers/auth_controller.dart';
import 'package:mi_store/controllers/storage_controller.dart';
import 'package:mi_store/models/product_model.dart';
import 'package:mi_store/utils/navigator_utils.dart';

import '../models/user_model.dart';
import '../screens/auth/signup_page.dart';
import '../screens/home/main_screen.dart';
import '../utils/custom_dialog.dart';

class UserProvider extends ChangeNotifier {
  List<String> _favouriteItems = [];
  List<String> get favouriteItems => _favouriteItems;

  List<Product> _favItems = [];
  List<Product> get favItems => _favItems;

  UserModel? _user;
  UserModel? get userData => _user;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;

  //Pick Image
  ImagePicker picker = ImagePicker();
  File _image = File('');
  File get image => _image;

  //Check Current User Auth State
  Future<void> checkAuthState(BuildContext context) async {
    Future.delayed(const Duration(seconds: 5), () {
      FirebaseAuth.instance.userChanges().listen((User? user) async {
        if (user == null) {
          Logger().e('User is currently signed out!');
          CustomNavigator.goTo(context, const SignupPage());
        } else {
          fetchData(user.uid, context).then((value) {
            CustomNavigator.goTo(context, const MainScreen());
            Logger().i('User is signed in ----> $user');
          });
        }
      });
    });
  }

  Future<void> fetchData(uid, context) async {
    _user = await AuthController().getUserData(uid);
    _favouriteItems = _user!.favourite;
    setUserName(_user!.name);
    notifyListeners();
  }

  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  Future<void> updateProfileData(BuildContext context) async {
    CustomDialog.show(context);
    if (_image.path != "") {
      String imageUrl =
          await StorageController().uploadImage(_image, "User Images");
      users.doc(_user!.uid).update(
          {"name": _nameController.text, "userImage": imageUrl}).then((value) {
        CustomDialog.toast(context, "User Updated");
        CustomDialog.dismiss(context);
      });
    } else {
      users
          .doc(_user!.uid)
          .update({"name": _nameController.text}).then((value) {
        CustomDialog.dismiss(context);
        CustomDialog.toast(context, "User Updated");
      });
    }
  }

  void setUserName(String name) {
    _nameController.text = name;
    notifyListeners();
  }

  Future<void> pickImage() async {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image = File(pickedImage.path);
      notifyListeners();
      Logger().i(_image.path);
    } else {
      Logger().e('No image selected');
    }
  }

  //Add Favourite Items
  void addToFavourite(BuildContext context, Product product) {
    _favouriteItems.add(product.id);
    _favItems.add(product);
    users.doc(_user!.uid).update({"favourite": _favouriteItems}).then((value) {
      CustomDialog.toast(context, "Added to Favourites");
    });
    notifyListeners();
  }

//Remove Favourite Items
  void removeFromFavourite(BuildContext context, Product product) {
    _favouriteItems.remove(product.id);
    _favItems.remove(product);
    users.doc(_user!.uid).update({"favourite": _favouriteItems}).then((value) {
      CustomDialog.toast(context, "Removed from Favourites");
    });
    notifyListeners();
  }

  void filterFavourites(List<Product> products) {
    List<Product> filteredList = [];
    for (var product in products) {
      if (_favouriteItems.contains(product.id) &&
          !_favItems.contains(product)) {
        filteredList.add(product);
      }
    }
    _favItems = filteredList;
    notifyListeners();
  }
}
