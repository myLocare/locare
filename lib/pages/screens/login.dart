// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:locare/data/web_services/auth_method.dart';

class Login extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String res = "";
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login"),
            Text("Email"),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            Text("Password"),
            TextField(
              controller: _passwordController,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async => {
                res = await AuthMethod().signInWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text),
                print(res),
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
