import 'package:flutter/material.dart';
import 'package:mi_store/providers/homepage_provider.dart';
import 'package:mi_store/screens/home/cart/cart.dart';
import 'package:mi_store/screens/home/favourite/favourite_page.dart';
import 'package:mi_store/screens/home/homepage.dart';
import 'package:mi_store/screens/orders/my_orders.dart';
import 'package:provider/provider.dart';

import 'profile_page/profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _mainPages = [
    const HomePage(),
    const FavouritePage(),
    const MyCart(),
    const MyOrders(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<HomepageProvider>(builder: (context, value, child) {
      return Scaffold(
          body: _mainPages[value.currentIndex],
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomNBIcon(
                text: "Home",
                icon: Icons.home,
                isActive: value.currentIndex == 0,
                onTap: () {
                  value.changeIndex(0);
                },
              ),
              BottomNBIcon(
                text: "Favourite",
                icon: Icons.favorite,
                isActive: value.currentIndex == 1,
                onTap: () {
                  value.changeIndex(1);
                },
              ),
              BottomNBIcon(
                text: "Cart",
                icon: Icons.shopping_cart,
                isActive: value.currentIndex == 2,
                onTap: () {
                  value.changeIndex(2);
                },
              ),
              BottomNBIcon(
                text: "Orders",
                icon: Icons.list_alt,
                isActive: value.currentIndex == 3,
                onTap: () {
                  value.changeIndex(3);
                },
              ),
              BottomNBIcon(
                text: "Profile",
                icon: Icons.person,
                isActive: value.currentIndex == 4,
                onTap: () {
                  value.changeIndex(4);
                },
              ),
            ],
          ));
    });
  }
}

class BottomNBIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;
  final String text;

  const BottomNBIcon({
    super.key,
    required this.icon,
    required this.isActive,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Column(
        children: [
          IconButton(
              onPressed: onTap,
              icon: Icon(
                icon,
                color: isActive ? Colors.amber.shade800 : Colors.grey.shade500,
              )),
          Text(text)
        ],
      ),
    );
  }
}
