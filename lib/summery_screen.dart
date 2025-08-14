import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.arrow_back),
              const SizedBox(height: 12),
              Text('Order Summary', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [Icon(Icons.person), Text('Address', style: GoogleFonts.poppins())]),
                  Column(children: [Icon(Icons.receipt_long_outlined), Text('Order Summary', style: GoogleFonts.poppins(fontWeight: FontWeight.w500, decoration: TextDecoration.underline))]),
                  Column(children: [Icon(Icons.payment), Text('Payment', style: GoogleFonts.poppins())]),
                ],
              ),
              const SizedBox(height: 20),
              Text('Delivery to:', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text('John Smith', style: GoogleFonts.poppins()),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('Home', style: GoogleFonts.poppins(fontSize: 12)),
                  ),
                  const Spacer(),
                  const Icon(Icons.edit, size: 18)
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Quisque fermentum ipsum vitae diam sagittis malesuada. Ut rutrum venenatis sem, non molestie leo vehicula a.',
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: Image.asset('assets/shoes.png', height: 50),
                  title: Text('Men’s Road Racing Shoes', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                  subtitle: Text('White/Black/University Red\n6 (EU 40)', style: GoogleFonts.poppins(fontSize: 12)),
                ),
              ),
              const SizedBox(height: 20),
              Text('Qty ▼', style: GoogleFonts.poppins()),
              const SizedBox(height: 10),
              Text('Price Details', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Subtotal', style: GoogleFonts.poppins()), Text('₹ 23,795.00', style: GoogleFonts.poppins())],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Delivery', style: GoogleFonts.poppins()), Text('₹ 1,250.00', style: GoogleFonts.poppins())],
              ),
              const Divider(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Total', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)), Text('₹ 25,045.00', style: GoogleFonts.poppins(fontWeight: FontWeight.w600))],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/payment'),
                  child: Text('Continue', style: GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
