import 'package:flutter/material.dart';
import 'package:my_day/screens/home/home.dart';
import 'package:my_day/shared/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Day',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Lato',
      ),
      initialRoute: Home.routeName,
      routes: routes,
    );
  }
}
