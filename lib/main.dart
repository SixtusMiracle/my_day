import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_day/screens/home/home.dart';
import 'package:my_day/shared/routes.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Day',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Lato',
      ),
      initialRoute: Home.routeName,
      routes: routes,
    );
  }
}
