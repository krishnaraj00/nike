import 'package:flutter/material.dart';
import 'package:nike/splash_screen.dart';
import 'package:nike/welcome%20screen.dart';

void main() {
  runApp(const NikeSuccessApp());
}

class NikeSuccessApp extends StatelessWidget {
  const NikeSuccessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignUpSuccessScreen(),
    );
  }
}

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
        const EdgeInsets.only(left: 24, right: 24, top: 60, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logos
            Row(
              children: [
                Image.asset(
                  'assets/image/Group 666.png', // Replace with your asset
                  width: 100,
                  height: 100,
                ),
                const SizedBox(width: 16),

              ],
            ),
            const SizedBox(height: 40),

            // Success message
            const Text.rich(
              TextSpan(
                text: 'You have been signed in\n',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  decorationThickness: 1.5,
                ),
                children: [
                  TextSpan(
                    text: 'successfully.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Continue button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>  IntermediateSplashScreen()),
                );
                // Navigate to next screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF130026), // Deep purple
                foregroundColor: Colors.white,
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
