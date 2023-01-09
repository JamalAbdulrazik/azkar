import 'package:flutter/material.dart';
import 'color_schemes.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MaterialDemoThemeData.themeData,
      home: const HomeScreen(),
    );
  }
}

