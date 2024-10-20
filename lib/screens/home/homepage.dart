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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomPoppinsText(
                  text: "Hello Ishan", fontSize: 22, color: Colors.black87),
              CustomPoppinsText(
                text: "Let's Start Shopping...",
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
              const SizedBox(height: 15),
              CarouselSlider(
                options: CarouselOptions(
                  height: 250.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
                items: offers.map((i) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(i),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cars.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.8,
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
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.grey.shade200],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.grey.shade700,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: Image.network(cars[index].image),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomPoppinsText(
                                    text: cars[index].name,
                                    fontSize: 14,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                  CustomPoppinsText(
                                    text: "\$${cars[index].price}",
                                    fontSize: 14,
                                    textOverflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
