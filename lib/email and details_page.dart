import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nike/sucess_page.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String email;

  const VerifyCodeScreen({super.key, required this.email});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final _codeController = TextEditingController();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _verifyAndSignUp() async {
    if (_codeController.text.trim() != "123456") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid code")),
      );
      return;
    }

    try {
      setState(() => _isLoading = true);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email,
        password: _passwordController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account created successfully")),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Signup failed")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
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
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Image.asset('assets/image/Group 666.png', height: 30),
                  const SizedBox(width: 12),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                "Now let’s make you a Nike Member.",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "We’ve sent a code to ${widget.email}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  Text(
                    "Edit",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _codeController,
                decoration: InputDecoration(
                  hintText: "Code*",
                  suffixIcon: const Icon(Icons.refresh),
                  border: border,
                ),
              ),
              const SizedBox(height: 4),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Resend code in 9s",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _fnameController,
                      decoration: InputDecoration(
                        hintText: "First Name*",
                        border: border,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _lnameController,
                      decoration: InputDecoration(
                        hintText: "Surname*",
                        border: border,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password*",
                  suffixIcon: const Icon(Icons.visibility),
                  border: border,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "x Minimum of 8 characters\nx Uppercase, lowercase letters and one number",
                style: TextStyle(fontSize: 12, height: 1.5),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  NikeSuccessApp(), // Replace with your screen
                      ),
                    );
                  },
                  child: const Text("Create Account"),
                ),
              ),

              const SizedBox(height: 10),
              const Text(
                "Get a Nike Member Reward on your birthday.",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
