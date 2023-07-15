import 'package:flutter/material.dart';
import 'core/utils/functions/navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: ThemeData(
          fontFamily: 'Quicksand'
        ),
      home: MainNavigator(),
    );
  }
}

