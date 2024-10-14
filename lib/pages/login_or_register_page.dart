import 'package:authentication/pages/login_page.dart';
import 'package:authentication/pages/register.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //initially show login
  bool showLoginPage = true;

  //toggle bwteen login and register page
  void toggleLoginRegister() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: toggleLoginRegister);
    } else {
      return RegisterPage(onTap: toggleLoginRegister);
    }
  }
}
