import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/util/background.dart';
import 'components/body.dart';

class Home extends StatelessWidget {
  static String routeName = "/home";

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
            icon: SvgPicture.asset(
              'assets/icons/mi_menu.svg',
              color: Color(0xFFFD939B),
            ),
          ),
        ],
      ),
      body: Body(),
    );
  }
}
