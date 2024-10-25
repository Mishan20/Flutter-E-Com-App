import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_store/components/custom_text/custom_poppins_text.dart';
import 'package:mi_store/models/product_model.dart';

import '../components/custom_buttons/custom_button1.dart';
import 'home/cart/cart.dart';

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
    return Scaffold(
      backgroundColor: Colors.grey.shade100, // Add a light background color
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(
                    color: Colors.black), // Dark back button for contrast
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        15), // Rounded corners for the image
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5), // Shadow for depth effect
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15), // Image clipping
                    child: Image.network(
                      widget.item.image,
                      width: double.infinity,
                      height: size.height * 0.35, // Adjust image size
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Add space after the image
                CustomPoppinsText(
                  text: widget.item.name,
                  fontSize: 24, // Larger font for title
                  fontWeight: FontWeight.bold,
                  color: Colors.black87, // Darker text color for readability
                ),
                const SizedBox(height: 10), // Add space before the price
                CustomPoppinsText(
                  text: "\$ ${widget.item.price}",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700, // Green color for the price
                ),
                const SizedBox(height: 20), // Add space before the description
                Text(
                  widget.item.description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color:
                        Colors.black54, // Slightly lighter for the description
                    height: 1.5, // Line height for better readability
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton1(
                  colors: [Colors.green.shade800, Colors.green.shade300],
                  size: Size(size.width, 50), // Adjusted size for the button
                  text: "Add To Cart",
                  ontap: () {
                    Navigator.push(context, CupertinoPageRoute(
                      builder: (context) {
                        return const MyCart();
                      },
                    ));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
