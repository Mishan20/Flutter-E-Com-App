import 'package:mi_store/models/product_model.dart';

class CartModel {
  int quantity;
  Product product;

  CartModel({required this.quantity, required this.product});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      product: Product.fromJson(json["product"] as Map<String, dynamic>),
      quantity: (json["quantity"] as num).toInt(),
    );
  }
  Map<String, dynamic> toJson() {
    return {"quantity": quantity, "product": product.toJson()};
  }
}
