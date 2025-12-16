import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_basics_tutorial/screens/forgot_pws_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showRegisterScreen;
  const LoginScreen({super.key, required this.showRegisterScreen});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // sign in function
  void signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone_android, size: 100),
                  SizedBox(height: 70),
                  Text(
                    'Hello Again!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Welcome back, you\'ve been missed',
                    style: TextStyle(fontSize: 20),
                  ),

                  SizedBox(height: 35),

                  // email text field
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Email",
                    ),
                  ),

                  SizedBox(height: 10),

                  // password text field
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Password",
                    ),
                  ),

                  // forgot password
                  Align(
                    heightFactor: 2,
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ForgotPwsScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "forgot password",
                        style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  // sign in
                  ElevatedButton(
                    onPressed: signIn,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.deepPurple,
                      ),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      minimumSize: WidgetStateProperty.all(
                        Size(double.infinity, 50),
                      ),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // not a member? register now
                  Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: widget.showRegisterScreen,
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
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
