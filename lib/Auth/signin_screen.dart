import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Auth/reuseable_widgets.dart';
import 'package:shop_app/main.dart';

import 'reset_password.dart';
import 'utils.dart';

class SigninScreen extends StatefulWidget {
  final Function togglePage;
  const SigninScreen(this.togglePage, {super.key});
  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool isVisible = false;
  final emailController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  void initState() {
    passwordTextController.text = passwordTextController.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign In',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
            const SizedBox(height: 20),
            reuseableTextField('Enter email', Icons.person_outlined, false,
                emailController, false, () {}),
            const SizedBox(height: 25),
            reuseableTextField(
              'Enter password',
              Icons.lock,
              isVisible,
              passwordTextController,
              true,
              makePasswordVisible,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 350,
              child: signInSignUpButton(
                context,
                true,
                () => signIn(
                  emailController.text.trim(),
                  passwordTextController.text.trim(),
                ),
              ),
            ),
            SizedBox(width: 350, child: forgotPassword(widget.togglePage)),
            const SizedBox(height: 10),
            SizedBox(width: 350, child: signUpOption(widget.togglePage)),
          ],
        ),
      ),
    );
  }

  void makePasswordVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  Widget signUpOption(togglePage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?  ',
          style: TextStyle(color: Colors.grey[900]),
        ),
        GestureDetector(
          onTap: togglePage,
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }

  Widget forgotPassword(togglePage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const ResetPasswordScreen();
            }));
          },
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
            ),
          ),
        )
      ],
    );
  }

  Future signIn(email, password) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      Utils.showSnackBar(
        error.message == 'Error'
            ? 'Invalid email or password.'
            : email == ''
                ? 'A non-empty email must be provided'
                : error.message,
      );
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
