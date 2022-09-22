import 'package:flutter/material.dart';
import 'details.dart';
import 'package:favorite_button/favorite_button.dart';

void main() {
  runApp(const MyNewApp());
}

class MyNewApp extends StatelessWidget {
  const MyNewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DetailsPage());
  }
}