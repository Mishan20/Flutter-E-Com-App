import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;

  void serUserName(String name){
    _nameController.text = name;
    notifyListeners();
  }
}