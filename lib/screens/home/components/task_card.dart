import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../models/task.dart';
import '../../../shared/constants.dart';
import '../../../shared/util/circular_gradient_icon.dart';
import '../../../shared/util/color_dot.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final Function()? press;
  final bool doneScreen;

  const TaskCard({
    Key? key,
    required this.task,
    this.press,
    this.doneScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        margin: EdgeInsets.only(bottom: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(miDefaultSize),
        ),
        elevation: 3.0,
        child: ListTile(
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
                child: doneScreen
                    ? SvgPicture.asset(
                        "assets/icons/done_task.svg",
                        color:
                            Color(miIcons[task.icon]?.colorCode ?? 0xffffffff)
                                .withOpacity(1.0),
                      )
                    : ColorDot(
                        color:
                            Color(miIcons[task.icon]?.colorCode ?? 0xffffffff),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: miDefaultSize * 0.4),
                child: CircularGradientIcon(
                  icon: miIcons[task.icon],
                ),
              ),
            ],
          ),
          title: Text(
            task.title,
            style: TextStyle(
              fontSize: miDefaultSize * 1.2,
              overflow: TextOverflow.ellipsis,
              color: miTextColor,
            ),
          ),
          trailing: Column(
            children: [
              Text(
                DateFormat('d MMM').format(task.schedule),
                style: TextStyle(
                  fontFamily: "Lato Black",
                  fontSize: miDefaultSize * 1.2,
                  color: miTextBoldColor,
                ),
              ),
              SizedBox(height: miDefaultSize - 4),
              Text(
                DateFormat.Hm().format(task.schedule),
                style: TextStyle(
                  fontFamily: "Lato Light",
                  color: miTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
