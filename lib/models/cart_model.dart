import 'package:mi_store/models/product_model.dart';

class CartModel {
  int quantity;
  Product product;
  
  CartModel({required this.quantity, required this.product});
}