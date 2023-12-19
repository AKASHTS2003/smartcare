import 'package:flutter/material.dart';
import 'screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Care Connect App',
      theme: ThemeData(
        primaryColor: Colors.red, // Set the primary color to red
      ),
      home: SplashScreen(),
    );
  }
}
