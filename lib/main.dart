import 'package:flutter/material.dart';
import 'package:my_day/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Day',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Home(),
    );
  }
}
