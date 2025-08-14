import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'address_screen.dart';
import 'bottom_nav.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: SafeArea(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bag",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),

                // PRODUCT CARD
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/image/shoe1.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nike Alphafly 3 Premium",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Men’s Road Racing Shoes",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                            Text(
                              "White/Black/University Red",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                            Text(
                              "6 (EU 40)",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // QTY & PRICE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Qty 1",
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                    Text(
                      "MRP: ₹ 23,795.00",
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  "Incl. of all taxes\n(Also includes all applicable duties)",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),


                // PRICE SUMMARY
                Column(
                  children: [
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal", style: GoogleFonts.poppins(fontSize: 16)),
                        Text("₹ 23,795.00", style: GoogleFonts.poppins(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery", style: GoogleFonts.poppins(fontSize: 16)),
                        Text("₹ 1,250.00", style: GoogleFonts.poppins(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "₹ 25,045.00",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),

                // CHECKOUT BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CheckoutFlowScreen()),
                      );
                    },
                    child: Text(
                      "Checkout",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: const NikeBottomNavBar(currentIndex: 4),
    );
  }
}
