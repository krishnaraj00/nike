import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bottom_nav.dart';

void main() {
  runApp(const NikeShopApp());
}

class NikeShopApp extends StatelessWidget {
  const NikeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const NikeshopPage(),
    );
  }
}

class NikeshopPage extends StatefulWidget {
  const NikeshopPage({super.key});

  @override
  State<NikeshopPage> createState() => _NikeshopPageState();
}

class _NikeshopPageState extends State<NikeshopPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  final List<Map<String, String>> highlights = [
    {'title': 'New Arrivals', 'image': 'assets/image/New arrivals.png'},
    {'title': 'Just Dropped: Alphafly 3', 'image': 'assets/image/just droped.png'},
    {'title': 'Nike Pegasus premium', 'image': 'assets/image/nike.png'},
    {'title': 'Air Force 1', 'image': 'assets/image/air force.png'},
    {'title': 'Tennis', 'image': 'assets/image/tennis.png'},
    {'title': 'Shop All', 'image': 'assets/image/shop all.png'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildHighlightCard(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.0,
            letterSpacing: 0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: SafeArea(
          child: Column(
            children: [
              // Custom AppBar-like section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left - Dual logo
                    Container(
                      width: 90,
                      height: 40,
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
                    const Icon(Icons.search, color: Colors.black),
                  ],
                ),
              ),

              // Main content scrollable
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    children: [
                      Text(
                        "Shop",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Tab bar
                      TabBar(
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.black,
                        tabs: const [
                          Tab(text: 'Men'),
                          Tab(text: 'Women'),
                          Tab(text: 'Kids'),
                        ],
                      ),

                      const SizedBox(height: 16),

                      Text(
                        "This Week’s Highlights",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Highlights Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: highlights.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          final item = highlights[index];
                          return buildHighlightCard(item['title']!, item['image']!);
                        },
                      ),

                      const SizedBox(height: 16),

                      // New & Featured banner
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage("assets/image/New and fea.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          "New & Featured",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Shoes banner
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage("assets/image/shoes.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          "Shoes",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NikeBottomNavBar(currentIndex: 4),
    );
  }
}
