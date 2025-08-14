import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/profile_screen.dart';

import 'cart.dart';

void main() {
  runApp(const NikeFavouritesApp());
}

class NikeFavouritesApp extends StatefulWidget {
  const NikeFavouritesApp({super.key});

  @override
  State<NikeFavouritesApp> createState() => _NikeFavouritesAppState();
}

class _NikeFavouritesAppState extends State<NikeFavouritesApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FavouritesPage(),
    );
  }
}

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> favouriteItems = [
      {
        "image": "assets/image/shoe1.png",
        "title": "Nike SB Dunk Low Pro",
        "price": "₹ 23,795.00"
      },
      {
        "image": "assets/image/shoe2.png",
        "title": "Nike Alphafly 3 Premium",
        "price": "₹ 23,795.00"
      },
      {
        "image": "assets/image/shoe3.png",
        "title": "Nike Air Max 270",
        "price": "₹ 23,795.00"
      },
      {
        "image": "assets/image/shoe4.png",
        "title": "Nike Vaporfly 3",
        "price": "₹ 23,795.00"
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      'Favourites',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: GridView.builder(
                  itemCount: favouriteItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final item = favouriteItems[index];
                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    item["image"]!,
                                    height: 110,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(Icons.favorite, color: Colors.orange),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Bestseller',
                              style: GoogleFonts.poppins(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item["title"]!,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'MRP : ${item["price"]}',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items:  [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.storefront_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Colors.orange), label: ''),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  BagScreen()),
                );
              },
              child:  Icon(Icons.shopping_cart_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ProfileScreen()),
                );
              },
              child:  Icon(Icons.person),
            ),
            label: '',
          )
        ],
      ),
    );
  }
}
