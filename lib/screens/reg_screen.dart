import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegistrationScreeen extends StatelessWidget {
  RegistrationScreeen({super.key});
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red[100],
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Register Account..'),
            SizedBox(
              height: 50,
              child: CupertinoTextField(
                controller: usernameController,
                placeholder: 'Enter your username',
              ),
            ),
            SizedBox(
              height: 50,
              child: CupertinoTextField(
                controller: passwordController,
                placeholder: "Enter your password",
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final username = usernameController.text.trim();
                final password = passwordController.text.trim();
                try {
                  final newuser = await _auth.createUserWithEmailAndPassword(
                      email: username, password: password);
                  if (newuser != null) {
                    Navigator.pop(context);
                  }
                } catch (e) {
                  log(e.toString(), name: 'firebase error');
                }
              },
              child: Text('Register'),
            )
          ]),
        ),
      ),
    );
  }
}
