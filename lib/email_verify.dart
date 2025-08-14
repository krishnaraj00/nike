import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SignInWithEmailScreen extends StatefulWidget {
  const SignInWithEmailScreen({super.key});

  @override
  State<SignInWithEmailScreen> createState() => _SignInWithEmailScreenState();
}

class _SignInWithEmailScreenState extends State<SignInWithEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool isValidEmail = false;
  bool isLoading = false;

  void _validateEmail(String value) {
    setState(() {
      isValidEmail = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value);
    });
  }

  Future<void> _continueWithEmail() async {
    if (!isValidEmail) return;

    setState(() {
      isLoading = true;
    });

    try {
      final email = _emailController.text.trim();
      final methods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

      if (methods.contains('password')) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Existing user. Please enter password.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email not registered. Proceed to sign up.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/image/Group 666.png', width: 50, height: 50),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              "Sign in with email",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF130026),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Maecenas a quam a elit porta hendrerit id elementum massa.",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _emailController,
              onChanged: _validateEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'krishnaraj@gmail.com',
                prefixIcon: const Icon(Icons.mail),
                suffixIcon: isValidEmail
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isValidEmail && !isLoading ? _continueWithEmail : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF130026),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Continue"),
              ),
            ),
            const SizedBox(height: 24),
            const Row(children: <Widget>[
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text("or continue with"),
              ),
              Expanded(child: Divider()),
            ]),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSocialButton(FontAwesomeIcons.google, Colors.red),
                _buildSocialButton(FontAwesomeIcons.facebookF, Colors.blue),
                _buildSocialButton(FontAwesomeIcons.apple, Colors.black),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text.rich(
                TextSpan(
                  text: 'Nam id elementum risus. ',
                  children: [
                    TextSpan(
                      text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                      ' Integer luctus enim non sapien ullamcorper congue.',
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 12, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }
}
