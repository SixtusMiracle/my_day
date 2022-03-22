import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MY DAY',
          style: TextStyle(
            fontFamily: 'Baloo',
            fontSize: 25,
            color: const Color(0xff181743),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_open_rounded),
            color: Color(0xFFFD939B),
          ),
        ],
      ),
    );
  }
}
