import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_day/models/mi_icon.dart';

import '../constants.dart';

class CircularGradientIcon extends StatelessWidget {
  final MiIcon? icon;
  final double height, width;
  final List<BoxShadow>? boxShadow;
  final Color? color;
  final Function()? press;

  const CircularGradientIcon({
    Key? key,
    required this.icon,
    this.height = 55,
    this.width = 55,
    this.boxShadow,
    this.color = Colors.white,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(9999, 9999)),
          gradient: LinearGradient(
            colors: [
              Color(icon!.gradientStartColor),
              Color(icon!.gradientStopColor)
            ],
            begin: Alignment(icon!.beginStart, icon!.beginStop),
            end: Alignment(icon!.endStart, icon!.endStop),
            stops: [0.0, 1.0],
          ),
          boxShadow: boxShadow,
        ),
        child: Padding(
          padding: const EdgeInsets.all(miDefaultSize * 1.2),
          child: SvgPicture.asset(
            icon!.iconPath,
            color: color,
          ),
        ),
      ),
    );
  }
}
