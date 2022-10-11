import 'package:flutter/material.dart';
import 'details.dart';
import 'login.dart';

void main() {
  runApp(const MyNewApp());
}

class MyNewApp extends StatelessWidget {
  const MyNewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const DetailsPage(),
        "/login": (context) => const LoginPage(),
      });
  }
}