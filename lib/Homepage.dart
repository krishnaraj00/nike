import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/product%20page.dart';

import 'bottom_nav.dart';
void main() {
  runApp(const NikeApp());
}

class NikeApp extends StatelessWidget {
  const NikeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const NikeHomePage(),
    );
  }
}


class NikeHomePage extends StatefulWidget {
  const NikeHomePage({super.key});

  @override
  State<NikeHomePage> createState() => _NikeHomePageState();
}

class _NikeHomePageState extends State<NikeHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: SafeArea(
          child: Column(
            children: [
              // Custom AppBar
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 90,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(6),
                              child: Image.asset(
                                'assets/image/tick.png',
                                height: 20,
                                width: 20,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          ClipOval(
                            child: Container(
                              color: Colors.grey[300],
                              padding: const EdgeInsets.all(6),
                              child: Image.asset(
                                'assets/image/jump.png',
                                height: 20,
                                width: 20,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.search, color: Colors.black, size: 28),
                  ],
                ),
              ),

              // Body
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Good Morning John Smith',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildSectionHeader('Top Picks for You', showSubtitle: true),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 240,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          ProductCard(
                            imagePath: 'assets/image/Rectangle 26.png',
                            name: 'Air Jordan 1 Low',
                            category: "Women's Shoes",
                            price: '₹ 8,295.00',
                          ),
                          ProductCard(
                            imagePath: 'assets/image/Rectangle 27.png',
                            name: 'Nike SB Dunk',
                            category: "Men's Shoes",
                            price: '₹ 23,795.00',
                          ),
                          ProductCard(
                            imagePath: 'assets/image/Rectangle 28 (1).png',
                            name: 'Jordan Lift Off',
                            category: "Men’s Shoes",
                            price: '₹ 13,295.00',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildSectionHeader('New From Nike'),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/image/Rectangle 17.png',
                        fit: BoxFit.cover,
                        height: 300,
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NikeBottomNavBar(currentIndex: 4),
    );
  }

  Widget _buildSectionHeader(String title, {bool showSubtitle = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'View All',
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        if (showSubtitle)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              'Recommended products',
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String category;
  final String price;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.category,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductPage()),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    imagePath,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.favorite_border, color: Colors.white),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                category,
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'MRP : $price',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
