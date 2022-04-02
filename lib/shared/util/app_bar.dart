import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_day/screens/done_tasks/done_tasks.dart';

import '../constants.dart';

AppBar buildAppBar({
  required BuildContext context,
  bool hasBackButton = false,
  bool hasActions = true,
  String title = "MY DAY",
}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        fontFamily: 'Baloo',
        fontSize: 25,
        color: miTextColor,
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    leading: hasBackButton
        ? IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(
              "assets/icons/back.svg",
              color: Color(0xffdfdfdf),
            ),
          )
        : null,
    actions: hasActions
        ? [
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, DoneTasks.routeName),
              icon: SvgPicture.asset(
                "assets/icons/mi_menu.svg",
                color: Color(0xFFFD939B),
              ),
            ),
          ]
        : null,
  );
}
