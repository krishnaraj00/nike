import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'email_screen.dart';
import 'email_verify.dart';
import 'main.dart'; // This is your SignInWithEmailScreen

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();

    // Wait for 2 seconds, then navigate to SignInWithEmailScreen
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignInWithEmailScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final String displayName = user?.displayName ?? 'Nike Member';

    return Scaffold(
      backgroundColor: const Color(0xFF130026),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nike logo
            Image.asset(
              'assets/image/Vector.png',
              width: 100,
              height: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 40),

            // Welcome text with Firebase name
            Text(
              'Hi krishnarajNS,\nWelcome to Nike.',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Thanks for becoming a\nMember!',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                height: 1.4,
              ),
            ),
            const Spacer(),

            const Text(
              'Member Since 2025',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 // Make sure this path is correct

class IntermediateSplashScreen extends StatefulWidget {
  const IntermediateSplashScreen({super.key});

  @override
  State<IntermediateSplashScreen> createState() =>
      _IntermediateSplashScreenState();
}

class _IntermediateSplashScreenState extends State<IntermediateSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _fadeController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF130026), // Dark purple
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Image.asset(
            'assets/image/Group 646.png',
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
