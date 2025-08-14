import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:nike/product%20page.dart';





class OrderSuccessPage extends StatefulWidget {
  @override
  _OrderSuccessPageState createState() => _OrderSuccessPageState();
}

class _OrderSuccessPageState extends State<OrderSuccessPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _fade = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => OrderConfirmationPage()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _star(double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: ScaleTransition(
        scale: _fade,
        child: Icon(Icons.star, color: Colors.white70, size: 16),
      ),
    );
  }
  Widget _tick(double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: ScaleTransition(
        scale: _fade,
        child: Icon(Icons.airplane_ticket, color: Colors.white70, size: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // These values should be adjusted per your image reference
    final starPositions = [
      Offset(width * 0.1, height * 1.25),
      Offset(width * 0.6, height * 0.25),
      Offset(width * 0.35, height * 0.45),
      Offset(width * 0.65, height * 0.5),
      Offset(width * 0.85, height * 2.5),
      Offset(width * 0.5, height * .2),
      Offset(width * 0.15, height * .7),
      Offset(width * 0.35, height * 1.2),
      Offset(width * 0.55, height * 1.8),
      Offset(width * 0.45, height * .7),

    ];
    final tickPositions = [

      Offset(width * 0.5, height * .2),
      Offset(width * 0.15, height * .7),
      Offset(width * 0.35, height * 1.2),
      Offset(width * 0.55, height * 1.8),
      Offset(width * 0.45, height * .7),

    ];

    return Scaffold(
      backgroundColor: Color(0xFF1A002B),
      body: Stack(
        children: [
          FadeTransition(
            opacity: _fade,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/image/Vector.png',
                    width: 80,
                    height: 80,
                  ),
                  // Icon(Icons.check_circle, color: Colors.white, size: 80),
                  SizedBox(height: 16),
                  Text('Order Successfully Placed',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Thanks for Purchasing with us',
                      style: TextStyle(color: Colors.white70, fontSize: 14)),
                  SizedBox(height: 12),
                  Text('Your Order ID - OD066577456774351100',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
          ),
          // Place stars at specific absolute offsets
          for (var pos in starPositions) _star(pos.dx, pos.dy),
          for (var pos in tickPositions) _tick(pos.dx, pos.dy),
        ],
      ),
    );
  }
}
// ------------ Screen 2: Order Confirmation ------------
class OrderConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
        child: Center(
        child: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Text('Order ID - OD066577456774351100',
    style: TextStyle(fontSize: 12, color: Colors.grey[700])),
    SizedBox(height: 16),
    Container(
    height: 180,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
    color: Colors.grey[100],
    borderRadius: BorderRadius.circular(8)),
    child: Row(
    children: [
    Container(
    width: 100,
    height: 100,
    child: Image.asset(
    'assets/image/shoe1.png',
    fit: BoxFit.cover,
    ),
    ),
    SizedBox(width: 12),
    Expanded(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text('Nike SB Dunk Low Pro',
    style: TextStyle(
    fontSize: 16, fontWeight: FontWeight.w600)),
    SizedBox(height: 4),
    Text(
    'Men’s Road Racing Shoes White/Black/…',
    style: TextStyle(
    fontSize: 14,
    color: Colors.grey,
    ),
    ),
    SizedBox(height: 4),
    Text('6 (EU 40)',
    style: TextStyle(
    fontSize: 14, color: Colors.grey[700])),
    SizedBox(height: 8),
    Text('MRP : ₹ 23,795.00',
    style: TextStyle(fontSize: 14)),
    ],
    ),
    ),
    ],
    ),
    ),
    SizedBox(height: 24),


    Row(
    children: [
    Text(
    '                 Successfully Placed!   ',
    style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,

    ),
    ),
    Container(
    width: 30,               // Set explicit size
    height: 30,
    decoration: BoxDecoration(

    color: Colors.green,
    shape: BoxShape.circle,
    ),alignment: Alignment.center,
    // padding: const EdgeInsets.all(12),
    child: Icon(
    Icons.check,               // ✔️ Material check icon
    size: 18,
    color: Colors.white,       // white tick on green
    ),
    ),
    ],),
      SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 140, // Increase Track Order button width
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                fixedSize: Size(140, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // smaller radius
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  // MaterialPageRoute(builder: (_) => OrderErrorPage()),
                  MaterialPageRoute(builder: (_) => OrderDetailsPage()),
                );
              },
              child: Text('Track Order'),
            ),
          ),
          SizedBox(width: 16),
          SizedBox(
            width: 140, // Increase Home button width
            height: 48,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                side: BorderSide(color: Colors.black),
                fixedSize: Size(140, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // smaller radius
                ),
              ),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Home'),
            ),
          ),
        ],
      ),

    ],
    ),
        ),
        ),
        ),
        ),
    );
  }
}




class OrderErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A002B),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('OOPS!',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                HexagonIcon(
                  child: Text(
                    '!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.redAccent,
                  size: 80,
                ),
                SizedBox(height: 16),

                SizedBox(height: 16),
                Text(
                  'Something went wrong.\nplease try again or go back to home.',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    side: BorderSide(color: Colors.redAccent),
                  ),
                  child: Text('Try again'),
                ),
                SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: Text('Back to Home', style: TextStyle(color: Colors.white70)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Reusable widget for hexagon-shaped icon container
class HexagonIcon extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final double size;const HexagonIcon({
    required this.child,
    required this.backgroundColor,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HexagonClipper(),
      child: Container(
        width: size,
        height: size,
        color: backgroundColor,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

// Custom clipper to draw a perfect hexagon
class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final numSides = 8;
    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final angle = (2 * pi) / numSides;

    for (int i = 0; i <= numSides; i++) {
      final x = center.dx + radius * cos(i * angle);
      final y = center.dy + radius * sin(i * angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
