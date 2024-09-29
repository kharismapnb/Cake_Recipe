import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resep Kue',
      theme: ThemeData(
        primaryColor: Colors.pink[300],
        hintColor: Colors.pinkAccent,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
          titleLarge:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        scaffoldBackgroundColor: Colors.pink[50],
      ),
      home: const LoginPage(),
    );
  }
}
