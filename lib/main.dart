import 'package:fast_food/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Food',
      theme: ThemeData(
        primaryColor: Color(0xffff7d80f),
      ),
      home: HomeScreen(),
    );
  }
}
