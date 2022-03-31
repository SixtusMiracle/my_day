import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class CircularGradientIcon extends StatelessWidget {
  final String icon;
  final int gradientStartColor, gradientStopColor;
  final double beginStart, beginStop, endStart, endStop, height, width;

  const CircularGradientIcon({
    Key? key,
    required this.icon,
    required this.gradientStartColor,
    required this.gradientStopColor,
    required this.beginStart,
    required this.beginStop,
    required this.endStart,
    required this.endStop,
    this.height = 55,
    this.width = 55,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(9999, 9999)),
        gradient: LinearGradient(
          colors: [Color(gradientStartColor), Color(gradientStopColor)],
          begin: Alignment(beginStart, beginStop),
          end: Alignment(endStart, endStop),
          stops: [0.0, 1.0],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(miDefaultSize * 1.2),
        child: SvgPicture.asset(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
