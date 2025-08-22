import 'package:flutter/material.dart';
import 'package:lab2/screens/welcome_screen.dart'; // Import the new welcome screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galleria App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: const Color(0xFFF0F0F0),
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(), // Start with the WelcomeScreen
    );
  }
}