import 'dart:developer';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  bool? checkedValue = false;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multi questions')),
      body: ListView(shrinkWrap: true, children: [
        Column(
          children: [
            ListTile(
              title: Text('Who developed Flutter?'),
            ),
            Text('Please select the answer'),
            CheckboxListTile(
              title: Text('Google'),
              value: widget.checkedValue,
              onChanged: (value) {
                widget.checkedValue = value;
                log(value.toString(), name: 'checkbox');
                setState(() {});
              },
            ),
            CheckboxListTile(
              title: Text('facebook'),
              value: widget.checkedValue,
              onChanged: (value) {
                widget.checkedValue = value;
                log(value.toString(), name: 'checkbox');
                setState(() {});
              },
            ),
            CheckboxListTile(
              title: Text('microsoft'),
              value: widget.checkedValue,
              onChanged: (value) {
                widget.checkedValue = value;
                log(value.toString(), name: 'checkbox');
                setState(() {});
              },
            ),
            CheckboxListTile(
              title: Text('Apple'),
              value: widget.checkedValue,
              onChanged: (value) {
                widget.checkedValue = value;
                log(value.toString(), name: 'checkbox');
                setState(() {});
              },
            ),
          ],
        ),
      ]),
    );
  }
}
