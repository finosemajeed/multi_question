import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_question/screens/home_screen.dart';
import 'package:multi_question/screens/reg_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber[200],
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login to Continue..'),
              SizedBox(
                height: 50,
                child: CupertinoTextFormFieldRow(
                  placeholder: 'Enter your username',
                  controller: usernameController,
                ),
              ),
              SizedBox(
                height: 50,
                child: CupertinoTextFormFieldRow(
                  controller: passwordController,
                  placeholder: 'Enter your password',
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    final userName = usernameController.text.trim();
                    final password = passwordController.text.trim();
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: userName, password: password);
                      if (user != null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }
                    } catch (e) {
                      log(e.toString(), name: 'firebase login error');
                    }
                  },
                  child: const Text('Login')),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegistrationScreeen()));
                },
                child: const Text('Don\'t have account. Register'),
              )
            ],
          ),
        )),
      ),
    );
  }
}
