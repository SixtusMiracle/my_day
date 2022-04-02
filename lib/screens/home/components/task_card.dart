import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/task.dart';
import '../../../shared/constants.dart';
import '../../../shared/util/circular_gradient_icon.dart';
import '../../../shared/util/color_dot.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final Function()? press;

  const TaskCard({
    Key? key,
    required this.task,
    required this.press,
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
                child: ColorDot(
                  color: Color(miIcons[task.icon]?.colorCode ?? 0xffffffff),
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
