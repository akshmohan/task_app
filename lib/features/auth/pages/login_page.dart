// ignore_for_file: implementation_imports, unnecessary_import, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:frontend/features/auth/pages/signup_page.dart';

class LoginPage extends StatefulWidget {

   static MaterialPageRoute route() => MaterialPageRoute(builder: (context) => const LoginPage());


  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void loginUser() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login.",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
              ),
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty ||
                    value.contains("@")) {
                  return "Email field cannot be empty!";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
              ),
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty ||
                    value.contains("@")) {
                  return "Password field cannot be empty!";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loginUser,
              child: Text(
                "LOGIN",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(SignupPage.route());
              },
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
