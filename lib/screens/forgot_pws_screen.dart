import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPwsScreen extends StatefulWidget {
  const ForgotPwsScreen({super.key});

  @override
  State<ForgotPwsScreen> createState() => _ForgotPwsScreenState();
}

class _ForgotPwsScreenState extends State<ForgotPwsScreen> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text,
      );

      // on successful pop the screen display a message using snackbar.
    } catch (e) {
      // print some error if you want
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.shade200,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your email, you will receive a mail with your new password',
              textAlign: TextAlign.center,
            ),

            TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: "example@gmail.com",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              controller: _emailController,
            ),

            ElevatedButton(
              onPressed: resetPassword,
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                  Colors.deepPurpleAccent.shade100,
                ),
              ),
              child: Text(
                'Reset Password',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
