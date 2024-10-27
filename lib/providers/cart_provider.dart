import 'package:flutter/material.dart';
import 'package:mi_store/models/cart_model.dart';
import 'package:mi_store/models/product_model.dart';
import 'package:mi_store/utils/custom_dialog.dart';
import 'package:provider/provider.dart';

import '../controllers/order_controller.dart';
import '../models/order_model.dart';
import '../models/user_model.dart';
import 'user_provider.dart';

class CartProvider extends ChangeNotifier {
  OrderController oController = OrderController();
  int _quantity = 1;
  int get quantity => _quantity;

  List<CartModel> _cartItems = [];
  List<CartModel> get cartItems => _cartItems;

  double _total = 0;
  double get total => _total;

  void increseQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decreseQuantity() {
    if (_quantity > 1) {
      _quantity--;
      notifyListeners();
    }
  }

  void addToCart(BuildContext context, Product product) {
    if (_cartItems.any((element) => element.product.id == product.id)) {
      _cartItems.removeWhere((element) => element.product.id == product.id);
      notifyListeners();
    } else {
      _cartItems.add(CartModel(product: product, quantity: _quantity));
      clearQuantity();
      CustomDialog.toast(context, "Added to Cart");
      notifyListeners();
    }
  }

  void clearQuantity() {
    _quantity = 1;
    notifyListeners();
  }

  void clearCart() {
    _total = 0;
    _cartItems = [];
    notifyListeners();
  }

  void increseCartItemQuantity(int index) {
    _cartItems[index].quantity++;
    notifyListeners();
  }

  void decreseCartItemQuantity(int index) {
    if (_cartItems[index].quantity != 1) {
      _cartItems[index].quantity--;
      notifyListeners();
    }
  }

  double calculateTotal() {
    double total = 0;
    for (var item in _cartItems) {
      total += item.product.price * item.quantity;
    }
    _total = total;
    return total;
  }

  Future<void> saveOrderDetails(BuildContext context) async {
    UserModel user =
        Provider.of<UserProvider>(context, listen: false).userData!;

    OrderModel oModel = OrderModel(
      totalAmount: _total,
      id: "",
      items: _cartItems,
      user: user,
    );
    oController.saveOrder(oModel, context);
  }
}
