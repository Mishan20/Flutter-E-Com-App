import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mi_store/components/custom_text/custom_poppins_text.dart';

import '../../models/car_model.dart';
import '../product_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> offers = [
    "https://c4.wallpaperflare.com/wallpaper/392/133/116/car-bmw-bmw-m4-wallpaper-preview.jpg",
    "https://wallpapers.com/images/featured/bmw-desktop-hd-wyawdmrxc44x1ere.jpg",
    "https://e1.pxfuel.com/desktop-wallpaper/460/742/desktop-wallpaper-bmw-2021-series-4-electric-car-landscape-2021-electric-cars.jpg",
    "https://w0.peakpx.com/wallpaper/643/480/HD-wallpaper-bmw-328-colors-landscape.jpg",
    "https://e0.pxfuel.com/wallpapers/48/480/desktop-wallpaper-bmw-steering-wheel-50219-px.jpg"
  ];

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  Icon(Icons.search, color: Colors.black),
                ],
              ),
              const CustomPoppinsText(text: "Hello Ishan", fontSize: 22),
              CustomPoppinsText(
                text: "Lets Start Shopping....",
                fontSize: 15,
                color: Colors.grey.shade700,
              ),
              const SizedBox(
                height: 10,
              ),
              CarouselSlider(
                options: CarouselOptions(height: 250.0, autoPlay: true),
                items: offers.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(i), fit: BoxFit.cover)),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 15,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cars.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                            car: cars[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            Image.network(cars[index].image),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomPoppinsText(
                                    text: cars[index].name,
                                    fontSize: 12,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                  CustomPoppinsText(
                                    text: "\$ ${cars[index].price}",
                                    fontSize: 12,
                                    textOverflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w700,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
