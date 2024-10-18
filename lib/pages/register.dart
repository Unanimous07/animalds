import 'package:authentication/components/my_button.dart';
import 'package:authentication/components/my_textfield.dart';
import 'package:authentication/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function() onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text editing controllers for username and password
  final _usernameController = TextEditingController();
  final _ConfirmPasswordController = TextEditingController();
  final _passwordController = TextEditingController();

  // Flag to indicate loading state (optional)
  bool _isLoading = false;

  // Sign in function
  Future<void> signUserUp() async {
    setState(() {
      _isLoading = true; // Show loading indicator while creating user account
    });

    // creating a user account with email and password
    try {
      if (_passwordController.text == _ConfirmPasswordController.text) {
        {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _usernameController.text,
            password: _passwordController.text,
          );
        }
      }

      // Successful login handling (e.g., navigate to home page)
      Navigator.pushReplacementNamed(
          context, '/home'); // Replace with your home page route
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthError(e);
    } finally {
      setState(() {
        _isLoading = false; // Hide loading indicator after sign in attempt
      });
    }
  }

  void handleFirebaseAuthError(FirebaseAuthException e) {
    String message;
    print(e.code);
    switch (e.code) {
      case 'user-not-found':
        message = "No account found for that email.";
        break;
      case 'invalid-credentials':
        message = "Incorrect password.";
        break;
      case 'too-many-requests':
        message =
            "Your account has been temporarily disabled due to too many failed login attempts. Please try again later.";
        break;
      case 'network-request-failed':
        message = "Please check your internet connection and try again.";
        break;
      default:
        message = "An error occurred. Please try again.";
    }

    // Display an error message to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF23D498), // Background color
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            // Allow scrolling on small screens
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo (you can add your own logo here)
                const SizedBox(height: 70),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                // Welcome message
                const SizedBox(height: 50),
                Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                ),

                // Username/Email field
                const SizedBox(height: 30),
                MyTextfield(
                  controller: _usernameController,
                  hintText: "Email",

                  obscureText: false, // Set keyboard type for email address
                ),

                // Password field
                const SizedBox(height: 30),
                MyTextfield(
                  controller: _passwordController,
                  hintText: "Password",
                  obscureText: true, // Hide password characters
                ),

                // Confirm Password field
                const SizedBox(height: 30),
                MyTextfield(
                  controller: _ConfirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true, // Hide password characters
                ),

                // Login button
                const SizedBox(height: 25),
                _isLoading
                    ? const CircularProgressIndicator()
                    : MyButton(
                        onTap: signUserUp,
                        text: "Register",
                      ),

                // Or continue with
                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[100],
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text("Or continue with"),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[100],
                      ),
                    ),
                  ],
                ),

                // Google button + Facebook button
                const SizedBox(height: 60),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google
                    SquareTile(
                      imagepath: "lib/images/google.png",
                      theight: 40.0,
                    ),

                    SizedBox(width: 20),

                    // Facebook
                    SquareTile(
                      imagepath: "lib/images/face.png",
                      theight: 40.0,
                    )
                  ],
                ),

                // Create account

                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "SignIn",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
