// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mi_store/components/custom_buttons/custom_button1.dart';
import 'package:mi_store/components/custom_text/custom_poppins_text.dart';
import 'package:mi_store/providers/payment_provider.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
import '../../product_view/product_view.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _CartState();
}

class _CartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomPoppinsText(
          text: "My Cart",
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Consumer<CartProvider>(builder: (context, value, child) {
        return value.cartItems.isNotEmpty
            ? Stack(
                children: [
                  Scrollbar(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(
                          bottom: 170), // Adjust for Buy Now button
                      itemCount: value.cartItems.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                          item: value.cartItems[index].product,
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 8.0),
                            child: Container(
                              height: 130,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 8,
                                    spreadRadius: 3,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        value.cartItems[index].product.image,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomPoppinsText(
                                              text: value.cartItems[index]
                                                  .product.name,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            const SizedBox(height: 4),
                                            CustomPoppinsText(
                                              text:
                                                  "\$ ${value.cartItems[index].product.price}",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.amber.shade800,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width:
                                                120, // Reduced button container width
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                color: Colors.amber.shade400,
                                                width: 2,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                IconButton(
                                                  icon: Icon(Icons.remove,
                                                      size: 20,
                                                      color:
                                                          Colors.red.shade800),
                                                  onPressed: () {
                                                    value
                                                        .decreseCartItemQuantity(
                                                            index);
                                                  },
                                                ),
                                                Text(
                                                  value
                                                      .cartItems[index].quantity
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.add,
                                                      size: 20,
                                                      color: Colors.green),
                                                  onPressed: () {
                                                    value
                                                        .increseCartItemQuantity(
                                                            index);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          CustomPoppinsText(
                                            text:
                                                "Total : ${(value.cartItems[index].product.price * value.cartItems[index].quantity)}",
                                            fontSize: 15,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 8,
                            offset: Offset(0, -3),
                          ),
                        ],
                      ),
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomPoppinsText(
                                  text: "Total",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                CustomPoppinsText(
                                  text: "\$ ${value.calculateTotal()}",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            CustomButton1(
                              colors: [Colors.amber, Colors.amber.shade800],
                              text: 'Buy Now',
                              size: Size(
                                  size.width * 0.85, 50), // Adjust button width
                              ontap: () {
                                Provider.of<PaymentProvider>(context,
                                        listen: false)
                                    .getPayment(
                                        value
                                            .calculateTotal()
                                            .toInt()
                                            .toString(),
                                        context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/favourite/empty_favourite.png",
                      width: 200, height: 200, fit: BoxFit.fill),
                  CustomPoppinsText(
                    text: "No Cart Items",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ));
      }),
    );
  }
}
