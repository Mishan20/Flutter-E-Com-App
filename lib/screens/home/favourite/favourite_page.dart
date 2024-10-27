// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mi_store/components/custom_text/custom_poppins_text.dart';
import 'package:mi_store/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../product_view/product_view.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Consumer<UserProvider>(builder: (context, value, child) {
            return value.favItems.isNotEmpty
                ? Column(
                    children: [
                      CustomPoppinsText(
                        text: "Favourite Items",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: value.favItems.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetails(
                                              item: value.favItems[index],
                                            )));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            value.favItems[index].image,
                                            width: 90,
                                            height: 90,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomPoppinsText(
                                                text:
                                                    value.favItems[index].name,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              SizedBox(height: 5),
                                              CustomPoppinsText(
                                                text:
                                                    "\$ ${value.favItems[index].price}",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.deepOrangeAccent,
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            value.removeFromFavourite(
                                                context, value.favItems[index]);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 28,
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
                        text: "No Favourite Items",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ));
          }),
        ),
      ),
    );
  }
}
