import 'package:flutter/material.dart';

import '../constants.dart';

class NoItem extends StatelessWidget {
  const NoItem({
    Key? key,
    required this.text,
    this.isHomeScreen = false,
  }) : super(key: key);

  final String text;
  final bool isHomeScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: isHomeScreen
          ? [
              SizedBox(height: miDefaultSize * 4),
              Text(
                text,
                style: TextStyle(
                  color: Colors.purple,
                  fontFamily: "Lato",
                  fontSize: miDefaultSize * 1.5,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.5,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset("assets/images/pointdown.gif"),
            ]
          : [
              SizedBox(height: miDefaultSize * 3),
              Image.asset("assets/images/none.png"),
              Text(
                text,
                style: TextStyle(
                  color: Colors.purple,
                  fontFamily: "Lato Black",
                  fontSize: miDefaultSize * 3,
                ),
                textAlign: TextAlign.center,
              ),
            ],
    );
  }
}
