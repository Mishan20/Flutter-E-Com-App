import 'package:flutter/material.dart';
import 'package:mi_store/components/custom_buttons/custom_button1.dart';
import 'package:mi_store/components/custom_text/custom_poppins_text.dart';

import '../../../models/product_model.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _CartState();
}

class _CartState extends State<MyCart> {
  List<Product> cars = [
    Product(
      description:
          "The BMW 3 Series is a compact executive car manufactured by the German automaker BMW since May 1975.",
      id: "1",
      image:
          "https://c4.wallpaperflare.com/wallpaper/392/133/116/car-bmw-bmw-m4-wallpaper-preview.jpg",
      name: "BMW 3 Series",
      price: 900000,
      type: "Sedan",
    ),
    Product(
      description:
          "The Mercedes-Benz C-Class is a line of compact executive cars produced by Daimler AG.",
      id: "2",
      image:
          "https://c4.wallpaperflare.com/wallpaper/392/133/116/car-bmw-bmw-m4-wallpaper-preview.jpg",
      name: "Mercedes C-Class",
      price: 850000,
      type: "Sedan",
    ),
    Product(
      description:
          "The Audi A4 is a line of compact executive cars produced since 1994 by the German car manufacturer Audi.",
      id: "3",
      image:
          "https://c4.wallpaperflare.com/wallpaper/392/133/116/car-bmw-bmw-m4-wallpaper-preview.jpg",
      name: "Audi A4",
      price: 800000,
      type: "Sedan",
    ),
    Product(
      description:
          "The Tesla Model S is an all-electric five-door liftback sedan produced by Tesla, Inc.",
      id: "4",
      image:
          "https://c4.wallpaperflare.com/wallpaper/392/133/116/car-bmw-bmw-m4-wallpaper-preview.jpg",
      name: "Tesla Model S",
      price: 950000,
      type: "Electric",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(),
        title: const CustomPoppinsText(
          text: "My Cart",
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: cars.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
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
                            cars[index].image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                            width: 10), // Add some space between image and text
                        Expanded(
                          // Expanded allows the text to fill the remaining space
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomPoppinsText(
                                  text: cars[index].name,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(height: 4),
                                CustomPoppinsText(
                                  text: "\$ ${cars[index].price}",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.amber.shade800,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.grey.shade400,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove, size: 10),
                                onPressed: () {},
                              ),
                              const Text(
                                "1",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add, size: 10),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
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
              height: 140,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomPoppinsText(
                          text: "Total",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomPoppinsText(
                          text: "\$ 3000000",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    CustomButton1(
                      colors: [Colors.amber, Colors.amber.shade800],
                      text: 'Buy Now',
                      size: size,
                      ontap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
