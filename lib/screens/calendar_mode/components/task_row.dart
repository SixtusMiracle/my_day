import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_day/shared/util/color_dot.dart';

import '../../../models/task.dart';
import '../../../shared/constants.dart';
import '../../../shared/util/circular_gradient_icon.dart';

class TaskRow extends StatelessWidget {
  const TaskRow({Key? key, required this.task, this.tap}) : super(key: key);

  final Task task;
  final Function()? tap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          miDefaultSize * 2, 0, miDefaultSize * 2, miDefaultSize * 0.7),
      child: Row(
        children: [
          Text(
            DateFormat('h:mm a').format(task.schedule),
            style: TextStyle(
              fontSize: miDefaultSize * 1.1,
              fontFamily: "Lato Black",
              color: miTextColor,
            ),
          ),
          SizedBox(width: miDefaultSize),
          ColorDot(color: Color(miIcons[task.icon]?.colorCode ?? 0xffffffff)),
          SizedBox(width: miDefaultSize),
          Expanded(
            child: InkWell(
              onTap: tap,
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
                      Padding(
                        padding:
                            const EdgeInsets.only(left: miDefaultSize * 0.4),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
