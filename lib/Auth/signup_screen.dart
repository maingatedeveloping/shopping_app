import 'package:flutter/material.dart';
import 'package:shop_app/Auth/reuseable_widgets.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/main.dart';

import 'utils.dart';

class SignUpScreen extends StatefulWidget {
  final Function togglePage;
  const SignUpScreen(this.togglePage, {super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final formKey = GlobalKey<FormState>();

class _SignUpScreenState extends State<SignUpScreen> {
  bool isVisible = false;

  final emailTextController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordTextController = TextEditingController();
  @override
  void initState() {
    passwordTextController.text = passwordTextController.text;
    //
    super.initState();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    userNameController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
              const SizedBox(height: 20),
              reuseableTextField('UserName', Icons.person_outlined, false,
                  userNameController, false, () {}),
              const SizedBox(height: 25),
              reuseableTextField('Email', Icons.email, false,
                  emailTextController, false, () {}),
              const SizedBox(height: 25),
              reuseableTextField(
                'Password',
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
                  false,
                  () => signUp(emailTextController.text.trim(),
                      passwordTextController.text.trim()),
                ),
              ),
              SizedBox(width: 350, child: signUpOption(widget.togglePage)),
            ],
          ),
        ),
      ),
    );
  }

  Widget signUpOption(togglePage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?  ',
          style: TextStyle(color: Colors.grey[900]),
        ),
        GestureDetector(
          onTap: togglePage,
          child: const Text(
            'Sign In',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }

  void makePasswordVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  Future signUp(emailController, passwordConroller) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController,
        password: passwordConroller,
      );
    } on FirebaseAuthException catch (error) {
      Utils.showSnackBar(error.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
