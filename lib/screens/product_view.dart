import 'package:flutter/material.dart';
import 'package:mi_store/components/custom_text/custom_poppins_text.dart';
import 'package:mi_store/models/product_model.dart';
import 'package:mi_store/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../components/custom_buttons/custom_button1.dart';

class ProductDetails extends StatefulWidget {
  final Product item;
  const ProductDetails({super.key, required this.item});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100, // Light background color
        body: Consumer<CartProvider>(builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackButton(
                      color: Colors.black,
                      onPressed: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                        value.clearQuantity();
                      },
                    ), // Back button
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 12,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          widget.item.image,
                          width: double.infinity,
                          height: size.height * 0.35,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomPoppinsText(
                      text: widget.item.name,
                      fontSize: 28, // Larger font for title
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    const SizedBox(height: 10),
                    CustomPoppinsText(
                      text: "\$ ${widget.item.price}",
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.green.shade700,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.item.description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomPoppinsText(text: "Quantity", fontSize: 18),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                color: Colors.amber.shade800,
                                onPressed: () {
                                  value.decreseQuantity();
                                },
                              ),
                              CustomPoppinsText(
                                  text: value.quantity.toString(),
                                  fontSize: 18),
                              IconButton(
                                icon: const Icon(Icons.add),
                                color: Colors.amber.shade800,
                                onPressed: () {
                                  value.increseQuantity();
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: value.cartItems.any(
                            (element) => element.product.id == widget.item.id)
                        ? CustomButton1(
                            colors: [Colors.red.shade800, Colors.red.shade300],
                            size: Size(size.width, 55),
                            text: "Remove From Cart",
                            ontap: () {
                              value.addToCart(context, widget.item);
                            },
                          )
                        : CustomButton1(
                            colors: [
                              Colors.orange.shade800,
                              Colors.amber.shade400
                            ],
                            size: Size(size.width, 55),
                            text: "Add To Cart",
                            ontap: () {
                              value.addToCart(context, widget.item);
                            },
                          ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
