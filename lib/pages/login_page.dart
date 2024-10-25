import 'package:authentication/components/my_button.dart';
import 'package:authentication/components/my_textfield.dart';
import 'package:authentication/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function() onTap;
  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controllers for username and password
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Flag to indicate loading state (optional)
  bool _isLoading = false;

  // Sign in function
  Future<void> signInUser() async {
    setState(() {
      _isLoading = true; // Show loading indicator while signing in
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _usernameController.text,
        password: _passwordController.text,
      );
      // Successful login handling (e.g., navigate to home page)
      Navigator.pushReplacementNamed(
          context, '/dashboard'); // Replace with your home page route
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
      case 'invalid-credential':
        message = "Incorrect email or password.";
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
                const Image(image: AssetImage('assets/images/white.png'), height: 100),
                

                // Welcome message
                const SizedBox(height: 50),
                Text(
                  'Welcome Back!',
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

                // Forgot password link
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Handle forgot password logic (e.g., navigate to password reset page)
                          print("Forgot password clicked!");
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Login button
                const SizedBox(height: 25),
                _isLoading
                    ? const CircularProgressIndicator()
                    : MyButton(
                        onTap: signInUser,
                        text: "Login",
                        
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
                    const Text("Don't have an account?"),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Create account",
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




//###########################################  original code  ###################################################
// import 'package:authentication/components/my_button.dart';
// import 'package:authentication/components/my_textfield.dart';
// import 'package:authentication/components/square_tile.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   // text editing controller
//   final _username = TextEditingController();

//   final _password = TextEditingController();

//   //loading state

//   // sign in function
//   void signUserIn() async {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         });

//     // sign in logic
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: _username.text, password: _password.text);
//     } on FirebaseAuthException catch (e) {
//       print(e.code);
//       if (e.code == 'user-not-found') {
//         print("Now here");
//         if (kDebugMode) {
//           print('No user found for that email.');
//         }
//       } else if (e.code == 'invalid-credential') {
//         if (kDebugMode) {
//           print('Wrong password provided for that user.');
//         }
//       } else if (e.code == "too-many-requests") {
//         print("Yout account has been temporariry banned ");
//       } else if (e.code == "network-request-failed") {
//         print("Check your network connection");
//       }
//     }
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xFF23D498),
//         body: SafeArea(
//           child: Center(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               //logo
//               const SizedBox(height: 70),
//               const Icon(
//                 Icons.lock,
//                 size: 100,
//               ),

//               //Welcome back you have been missed
//               const SizedBox(height: 50),
//               Text(
//                 'Welcome back you have been missed',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.grey[700],
//                 ),
//               ),

//               //username/email field

//               const SizedBox(height: 30),
//               MyTextfield(
//                 controller: _username,
//                 hintText: "Email or PhoneNumber",
//                 obscureText: false,
//               ),

//               //password field
//               const SizedBox(height: 30),
//               MyTextfield(
//                 controller: _password,
//                 hintText: "Password",
//                 obscureText: true,
//               ),

//               //forgot password
//               const SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       "Forgot Password?",
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               //login button
//               const SizedBox(
//                 height: 25,
//               ),
//               MyButton(
//                 onTap: signUserIn,
//               ),

//               //or continue with
//               const SizedBox(height: 20),

//               Row(
//                 children: [
//                   Expanded(
//                     child: Divider(
//                       thickness: 0.5,
//                       color: Colors.grey[100],
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 6,
//                   ),
//                   const Text("Or continue with"),
//                   const SizedBox(
//                     width: 6,
//                   ),
//                   Expanded(
//                     child: Divider(
//                       thickness: 0.5,
//                       color: Colors.grey[100],
//                     ),
//                   ),
//                 ],
//               ),

//               //google button + facebook button
//               const SizedBox(
//                 height: 60,
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // google
//                   SquareTile(
//                     imagepath: "lib/images/google.png",
//                     theight: 40.0,
//                   ),

//                   SizedBox(
//                     width: 20,
//                   ),

//                   // Facebook
//                   SquareTile(
//                     imagepath: "lib/images/face.png",
//                     theight: 40.0,
//                   )
//                 ],
//               ),

//               //create account

//               const SizedBox(
//                 height: 40,
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Don't have an account"),
//                   SizedBox(
//                     width: 4,
//                   ),
//                   Text(
//                     "Create account",
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   )
//                 ],
//               )
//             ],
//           )),
//         ));
//   }
// }
