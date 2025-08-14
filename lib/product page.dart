import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/payment_screen.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int selectedSize = 8;
  int selectedImage = 0;

  final List<String> productImages = [
    "assets/image/Rectangle 26.png",
    "assets/image/Rectangle 27.png",
    "assets/image/Rectangle 28 (1).png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Custom Top Bar using SafeArea
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Nike SB Dunk Low Pro",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // 🔹 Product Image Carousel
                Container(
                  width: 355,
                  height: 301,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      PageView.builder(
                        itemCount: productImages.length,
                        onPageChanged: (index) {
                          setState(() => selectedImage = index);
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Image.asset(
                              productImages[index],
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                      ),
                      // 🔹 Dots indicator
                      Positioned(
                        bottom: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            productImages.length,
                                (index) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: selectedImage == index
                                    ? Colors.black
                                    : Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // 🔹 Product Info
                Text(
                  "Nike SB Dunk Low Pro",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Skate Shoes",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "MRP : ₹23,795.00",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Inclusive of all taxes (also includes all applicable duties)",
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 Size Selection
                Text(
                  "Size - UK",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  children: [6, 7, 8, 9, 10, 11].map((size) {
                    final isSelected = selectedSize == size;
                    return GestureDetector(
                      onTap: () => setState(() => selectedSize = size),
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.black : Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          size.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const Spacer(),

                // 🔹 Bottom Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyOrdersPage()),
                          );
                        },
                        child: Text(
                          "Add to Bag",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OrderDetailsPage()),
                          );
                        },
                        child: Text(
                          "Buy Now",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}




class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  Color _getStatusColor(String status) {
    if (status.toLowerCase().contains("cancelled")) return Colors.red;
    if (status.toLowerCase().contains("refund")) return Colors.orange;
    return Colors.green; // default delivered
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> orders = [
      {"image": "assets/image/Rectangle 26.png", "status": "Delivered on Feb 07", "rate": true},
      {"image": "assets/image/Rectangle 27.png", "status": "Delivered on Dec 25", "rate": true},
      {"image": "assets/image/Rectangle 28 (1).png", "status": "Refund Completed", "rate": true},
      {"image": "assets/image/Rectangle 26.png", "status": "Cancelled on Dec 10", "rate": true},
      {"image": "assets/image/Rectangle 27.png", "status": "Cancelled on Nov 20", "rate": true},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top:50),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // 🔹 Custom Top Bar
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Hi-Nike My Order",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 🔹 Search bar
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: GoogleFonts.poppins(),
                        decoration: InputDecoration(
                          hintText: 'Search Product',
                          hintStyle: GoogleFonts.poppins(fontSize: 14),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Search",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),

                // 🔹 Orders Grid
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 163 / 224, // exact card ratio
                    ),
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      final statusColor = _getStatusColor(order["status"]);

                      return Container(
                        width: 163,
                        height: 224,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 🔹 Product Image
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    order["image"],
                                    width: 139,
                                    height: 92,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),

                              // 🔹 Status text with dynamic color
                              Text(
                                order["status"],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: statusColor,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),

                              // 🔹 Rating stars
                              if (order["rate"])
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(
                                    5,
                                        (i) => const Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                              const SizedBox(height: 4),

                              // 🔹 Rate product link
                              Text(
                                "Rate this product now",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  OrderErrorPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Hi-Nike Order Details",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 142,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "assets/image/Rectangle 27.png",
                          height: 110,
                          width: 110,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Nike SB Dunk Low Pro",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Men’s Road Racing Shoes",
                              style: GoogleFonts.poppins(
                                color: Colors.grey[600],
                                fontSize: 13,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "MRP: ₹23,795.00",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.check_circle, color: Colors.green),
                        title: Text("Order Confirmed, Today",
                            style: GoogleFonts.poppins()),
                        subtitle: Text("Your order has been placed.",
                            style: GoogleFonts.poppins(fontSize: 12)),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.local_shipping, color: Colors.grey),
                        title: Text("Shipped Expected by Fri 7th Feb",
                            style: GoogleFonts.poppins()),
                        subtitle: Text("Item ready to be shipped.",
                            style: GoogleFonts.poppins(fontSize: 12)),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.delivery_dining, color: Colors.grey),
                        title: Text("Out For Delivery", style: GoogleFonts.poppins()),
                        subtitle: Text("Item is on the way.",
                            style: GoogleFonts.poppins(fontSize: 12)),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.home, color: Colors.grey),
                        title: Text("Delivery Expected By Sun 9th Feb",
                            style: GoogleFonts.poppins()),
                        subtitle: Text("Item to be delivered soon.",
                            style: GoogleFonts.poppins(fontSize: 12)),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Edit Order",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
