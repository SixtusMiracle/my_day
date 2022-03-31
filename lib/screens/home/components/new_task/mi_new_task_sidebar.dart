import 'package:flutter/material.dart';
import 'package:my_day/shared/constants.dart';

class MiNewTaskSidebar extends StatelessWidget {
  const MiNewTaskSidebar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Material(
      type: MaterialType.transparency,
      child: Container(
        height: size.height,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(miDefaultSize * 1.3),
            bottomLeft: Radius.circular(miDefaultSize * 1.3),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x33181743),
              offset: Offset(0, 4),
              blurRadius: 8,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: miDefaultSize * 1.5,
            vertical: miDefaultSize * 0.01,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "NEW TASK",
                  style: TextStyle(
                    fontFamily: "Baloo",
                    color: miTextColor,
                    fontSize: miDefaultSize * 2.4,
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
