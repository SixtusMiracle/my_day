import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.03, 1.0),
          end: Alignment(0.03, -0.92),
          colors: [const Color(0xe5ffffff), const Color(0x00caebfe)],
          stops: [0.0, 1.0],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: -10,
            right: 0,
            child: Image.asset(
              "assets/images/base_bg.png",
            ),
          ),
          Positioned(
            right: -100,
            bottom: -10,
            child: Image.asset("assets/images/base_on-top.png"),
          ),
          child,
        ],
      ),
    );
  }
}
