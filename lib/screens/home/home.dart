import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_day/shared/constants.dart';

import 'components/body.dart';

class Home extends StatelessWidget {
  static String routeName = "/home";

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MY DAY',
          style: TextStyle(
            fontFamily: 'Baloo',
            fontSize: 25,
            color: miTextColor,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
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
      ),
      body: Body(),
    );
  }
}
