import 'package:flutter/material.dart';

import '../constants.dart';

class MiButtonPrimary extends StatelessWidget {
  const MiButtonPrimary({
    Key? key,
    this.verticalSymmetricPadding = miDefaultSize * 0.01,
    required this.text,
    this.press,
  }) : super(key: key);

  final double verticalSymmetricPadding;
  final String text;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.symmetric(
        horizontal: miDefaultSize * 1.5,
        vertical: verticalSymmetricPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(miDefaultSize * 3),
        gradient: LinearGradient(
          begin: Alignment(1.22, -1.22),
          end: Alignment(-0.65, 1.52),
          colors: [const Color(0xff00ffff), const Color(0xff254dde)],
          stops: [0.0, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x4d00ffff),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "Baloo",
            fontSize: miDefaultSize * 1.5,
            color: Colors.white,
          ),
        ),
        onPressed: press,
      ),
    );
  }
}
