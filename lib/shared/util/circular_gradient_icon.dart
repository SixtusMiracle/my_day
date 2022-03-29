import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

Container circularGradientIcon(
    {required String icon, required int dotColorCode}) {
  return Container(
    height: 120,
    width: 55,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.elliptical(9999, 9999)),
      gradient: LinearGradient(
        // TODO: Generate gradient based on dotColorCode
        colors: [Color(0xfffe1e9a), Color(0xfffea64c)],
        begin: Alignment(1.0, -1.0),
        end: Alignment(-0.83, 1.0),
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
