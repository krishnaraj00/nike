import 'package:flutter/material.dart';
import 'email and details_page.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmailEntryScreen extends StatefulWidget {
  const EmailEntryScreen({super.key});

  @override
  State<EmailEntryScreen> createState() => _EmailEntryScreenState();
}

class _EmailEntryScreenState extends State<EmailEntryScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _continue() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerifyCodeScreen(email: _emailController.text),
        ),
      );
    }
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return Container(
      width: 60,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: FaIcon(icon, color: color),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Social login not implemented.")),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.grey),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Row(
                  children: [
                    Image.asset('assets/image/Group 666.png', height: 30),
                    // Your logo path
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  "Enter your email to join us\nor sign in.",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text("India", style: TextStyle(fontWeight: FontWeight.w500)),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Change", style: TextStyle(decoration: TextDecoration.underline)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _emailController,
                  validator: (val) => val != null && val.contains("@") ? null : "Enter valid email",
                  decoration: InputDecoration(
                    hintText: "Email*",
                    border: border,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                    children: [
                      TextSpan(text: "By continuing, I agree to Nike’s "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(color: Colors.deepPurple, decoration: TextDecoration.underline),
                      ),
                      TextSpan(text: " and "),
                      TextSpan(
                        text: "Terms of Use.",
                        style: TextStyle(color: Colors.deepPurple, decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: _isLoading ? null : _continue,
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Continue"),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text("or", style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSocialButton(FontAwesomeIcons.google, Colors.red),
                    _buildSocialButton(FontAwesomeIcons.facebookF, Colors.blue),
                    _buildSocialButton(FontAwesomeIcons.apple, Colors.black),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
