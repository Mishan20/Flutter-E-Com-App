import 'package:flutter/material.dart';
import 'package:mi_store/components/custom_text/custom_poppins_text.dart';
import 'package:mi_store/models/car_model.dart';

import '../components/custom_buttons/custom_button1.dart';

class ProductDetails extends StatefulWidget {
  final Car car;
  const ProductDetails({super.key, required this.car});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackButton(),
                  Image.network(widget.car.image),
                  CustomPoppinsText(
                    text: widget.car.name,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomPoppinsText(
                    text: "\$ ${widget.car.price}",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  Text(
                    widget.car.description,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton1(
                  colors: [Colors.green.shade800, Colors.green.shade300],
                  size: size,
                  text: "Add To Cart",
                  ontap: () {},
                ),
              )
            ],
          )),
    );
  }
}
