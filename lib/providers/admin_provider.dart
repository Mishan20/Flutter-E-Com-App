import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:mi_store/models/product_model.dart';
import 'package:mi_store/utils/custom_dialog.dart';

import '../controllers/storage_controller.dart';

class AdminProvider extends ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  File _image = File("");
  CollectionReference product =
      FirebaseFirestore.instance.collection('Products');

  TextEditingController get nameController => _nameController;
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get priceController => _priceController;
  TextEditingController get typeController => _typeController;
  File get image => _image;
  ImagePicker picker = ImagePicker();

  Future<void> addProduct(context) async {
    if (_nameController.text.isEmpty) {
      CustomDialog.toast(context, "Enter Product Name");
    } else if (_descriptionController.text.isEmpty) {
      CustomDialog.toast(context, "Enter Product Description");
    } else if (_priceController.text.isEmpty) {
      CustomDialog.toast(context, "Enter Product Price");
    } else if (_typeController.text.isEmpty) {
      CustomDialog.toast(context, "Enter Product Type");
    } else if (_image.path.isEmpty) {
      CustomDialog.toast(context, "Select Product Image");
    } else {
      CustomDialog.show(context);
      String imageUrl =
          await StorageController().uploadImage(_image, "Product Images");
      DocumentReference productDoc = await product.add({
        "name": _nameController.text,
        "description": _descriptionController.text,
        "price": _priceController.text,
        "type": _typeController.text,
        "image": imageUrl,
      }).then((value) {
        product.doc(value.id).update({"id": value.id});
        CustomDialog.toast(context, "Product Added");
        CustomDialog.dismiss(context);
        _descriptionController.clear();
        _nameController.clear();
        _priceController.clear();
        _typeController.clear();
        _image = File("");
        notifyListeners();
        return value;
      });
    }
  }

  Future<void> pickImage(context) async {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image = File(pickedImage.path);
      notifyListeners();
      Logger().i(_image.path);
    } else {
      CustomDialog.toast(context, "No image selected");
    }
  }

  Future<List<Product>> fetchProducts(context) async {
    QuerySnapshot snapshot = await product.get();
    List<Product> products = [];
    for (var e in snapshot.docs) {
      Product product = Product.fromJson(e.data() as Map<String, dynamic>);
      products.add(product);
    }
    return products;
  }
}
