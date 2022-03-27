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
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_image.png'),
          fit: BoxFit.cover,
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
