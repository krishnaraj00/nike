import 'package:flutter/material.dart';
import 'package:nike/profile_screen.dart';
import 'package:nike/shop_page.dart';

import 'Homepage.dart';
import 'cart.dart';
import 'favourite_section.dart';



class NikeBottomNavBar extends StatelessWidget {
  /// Index of the tab that should appear selected
  final int currentIndex;

  const NikeBottomNavBar({Key? key, required this.currentIndex})
      : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    // 🛈 PushReplacement keeps ONE instance of each page in the stack
    //    – adjust to `push` if you prefer normal stacking.
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const NikeHomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const NikeshopPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const FavouritesPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => BagScreen()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.storefront_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          // orange only when selected
          icon: Icon(Icons.favorite_outline),
          activeIcon: Icon(Icons.favorite, color: Colors.orange),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: '',
        ),
      ],
    );
  }
}
