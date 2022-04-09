import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../screens/done_tasks/done_tasks.dart';
import '../animations/mi_slide_left_page_route.dart';
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
              onPressed: () => Navigator.push(
                  context, MiSlideLeftPageRoute(page: DoneTasks())),
              icon: SvgPicture.asset(
                "assets/icons/mi_menu.svg",
                color: Color(0xFFFD939B),
              ),
            ),
          ]
        : null,
  );
}
