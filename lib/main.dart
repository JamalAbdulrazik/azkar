import 'package:flutter/material.dart';
import 'theme/color_schemes.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar', 'EG'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MaterialDemoThemeData.themeData,
      home: const Directionality(
          textDirection: TextDirection.rtl,
          child: HomeScreen()),
    );
  }
}

