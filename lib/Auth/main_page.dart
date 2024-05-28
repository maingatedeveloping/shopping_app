import 'package:flutter/material.dart';
import 'package:shop_app/Auth/signin_screen.dart';
import 'package:shop_app/Auth/signup_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  void toggle() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogin ? SigninScreen(toggle) : SignUpScreen(toggle);
  }
}
