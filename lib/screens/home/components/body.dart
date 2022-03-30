import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_day/models/todo.dart';
import 'package:my_day/shared/constants.dart';
import 'package:intl/intl.dart';

import '../../../shared/util/background.dart';
import '../../../shared/util/circular_gradient_icon.dart';
import '../../../shared/util/color_dot.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: miDefaultSize * 1.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: miDefaultSize * 2.3),
            Card(
              // TODO: Extract this widget
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(miDefaultSize),
              ),
              elevation: 3.0,
              child: ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(
                  vertical: miDefaultSize * 0.8,
                  horizontal: miDefaultSize * 0.6,
                ),
                leading: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: ColorDot(color: Color(todos[0].colorCode)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: miDefaultSize * 0.4),
                      child: CircularGradientIcon(
                        icon: todos[0].icon,
                        gradientStartColor: todos[0].gradientStartColor,
                        gradientStopColor: todos[0].gradientStopColor,
                        beginStart: todos[0].beginStart,
                        beginStop: todos[0].beginStop,
                        endStart: todos[0].endStart,
                        endStop: todos[0].endStop,
                      ),
                    ),
                  ],
                ),
                title: Text(
                  todos[0].title,
                  style: TextStyle(
                    fontSize: miDefaultSize * 1.20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                trailing: Column(
                  children: [
                    Text(
                      DateFormat('d MMM').format(todos[0].schedule),
                      style: TextStyle(
                        fontFamily: "Lato Black",
                        fontSize: miDefaultSize * 1.2,
                      ),
                    ),
                    SizedBox(height: miDefaultSize - 4),
                    Text(
                      DateFormat.Hm().format(todos[0].schedule),
                      style: TextStyle(
                        fontFamily: "Lato Light",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
