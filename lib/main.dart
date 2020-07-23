import 'package:flutter/material.dart';
import 'package:quotes_app/home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"QUOTES GENERATOR",
      debugShowCheckedModeBanner: false,
      home:Home()
    );
  }
}
