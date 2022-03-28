import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

AppBar buildAppBar() {
  return AppBar(
    title: const Text(
      'MY DAY',
      style: TextStyle(
        fontFamily: 'Baloo',
        fontSize: 25,
        color: miTextColor,
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/icons/mi_menu.svg',
          color: const Color(0xFFFD939B),
        ),
      ),
    ],
  );
}
