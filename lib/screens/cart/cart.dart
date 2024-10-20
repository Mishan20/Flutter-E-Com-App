import 'package:flutter/material.dart';
import 'package:mi_store/components/custom_buttons/custom_button1.dart';
import 'package:mi_store/components/custom_text/custom_poppins_text.dart';

import '../../models/car_model.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _CartState();
}

class _CartState extends State<MyCart> {
  List<Car> cars = [
    Car(
      description:
          "The BMW 3 Series is a compact executive car manufactured by the German automaker BMW since May 1975.",
      id: 1,
      image:
          "https://c4.wallpaperflare.com/wallpaper/392/133/116/car-bmw-bmw-m4-wallpaper-preview.jpg",
      name: "BMW 3 Series",
      price: 900000,
      type: "Sedan",
    ),
    Car(
      description:
          "The Mercedes-Benz C-Class is a line of compact executive cars produced by Daimler AG.",
      id: 2,
      image:
          "https://c4.wallpaperflare.com/wallpaper/392/133/116/car-bmw-bmw-m4-wallpaper-preview.jpg",
      name: "Mercedes C-Class",
      price: 850000,
      type: "Sedan",
    ),
    Car(
      description:
          "The Audi A4 is a line of compact executive cars produced since 1994 by the German car manufacturer Audi.",
      id: 3,
      image:
          "https://c4.wallpaperflare.com/wallpaper/392/133/116/car-bmw-bmw-m4-wallpaper-preview.jpg",
      name: "Audi A4",
      price: 800000,
      type: "Sedan",
    ),
    Car(
      description:
          "The Tesla Model S is an all-electric five-door liftback sedan produced by Tesla, Inc.",
      id: 4,
      image:
          "https://c4.wallpaperflare.com/wallpaper/392/133/116/car-bmw-bmw-m4-wallpaper-preview.jpg",
      name: "Tesla Model S",
      price: 950000,
      type: "Electric",
    ),
    Car(
      description:
          "The Lexus ES is a series of mid-size luxury cars marketed by Lexus, the luxury division of Toyota.",
      id: 5,
      image:
          "https://c4.wallpaperflare.com/wallpaper/392/133/116/car-bmw-bmw-m4-wallpaper-preview.jpg",
      name: "Lexus ES",
      price: 870000,
      type: "Sedan",
    ),
    Car(
      description:
          "The Jaguar XE is a rear or all-wheel-drive compact executive sedan produced by Jaguar.",
      id: 6,
      image:
          "https://c4.wallpaperflare.com/wallpaper/392/133/116/car-bmw-bmw-m4-wallpaper-preview.jpg",
      name: "Jaguar XE",
      price: 860000,
      type: "Sedan",
    ),
    Car(
      description:
          "The Porsche Panamera is a full-sized luxury vehicle manufactured by the German automobile manufacturer Porsche.",
      id: 7,
      image:
          "https://c4.wallpaperflare.com/wallpaper/392/133/116/car-bmw-bmw-m4-wallpaper-preview.jpg",
      name: "Porsche Panamera",
      price: 1200000,
      type: "Luxury",
    ),
    Car(
      description:
          "The Volvo S60 is a compact executive car manufactured and marketed by Volvo since 2000.",
      id: 8,
      image:
          "https://c4.wallpaperflare.com/wallpaper/392/133/116/car-bmw-bmw-m4-wallpaper-preview.jpg",
      name: "Volvo S60",
      price: 830000,
      type: "Sedan",
    ),
    Car(
      description:
          "The Genesis G70 is a compact executive car manufactured by the South Korean luxury brand Genesis.",
      id: 9,
      image:
          "https://c4.wallpaperflare.com/wallpaper/392/133/116/car-bmw-bmw-m4-wallpaper-preview.jpg",
      name: "Genesis G70",
      price: 890000,
      type: "Sedan",
    ),
    Car(
      description:
          "The Alfa Romeo Giulia is a compact executive car produced by the Italian car manufacturer Alfa Romeo.",
      id: 10,
      image:
          "https://c4.wallpaperflare.com/wallpaper/392/133/116/car-bmw-bmw-m4-wallpaper-preview.jpg",
      name: "Alfa Romeo Giulia",
      price: 880000,
      type: "Sedan",
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
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            Image.network(
                              cars[index].image,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomPoppinsText(
                                    text: cars[index].name,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomPoppinsText(
                                    text: "\$ ${cars[index].price}",
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                            )),
                            Container(
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 2,
                                  )),
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.remove,
                                      size: 15,
                                    ),
                                    Text("1",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Icon(
                                      Icons.add,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ]),
                        )),
                  );
                }),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomPoppinsText(
                            text: "Total",
                            fontSize: 18,
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
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
