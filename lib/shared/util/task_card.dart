import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../models/task.dart';
import '../constants.dart';
import 'circular_gradient_icon.dart';
import 'color_dot.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  final Function()? press;
  final bool isDoneScreen, isMarkDoneScreen;

  const TaskCard({
    Key? key,
    required this.task,
    this.press,
    this.isDoneScreen = false,
    this.isMarkDoneScreen = false,
  }) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
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
                child: widget.isDoneScreen
                    ? SvgPicture.asset(
                        "assets/icons/done_task.svg",
                        color: Color(miIcons[widget.task.icon]?.colorCode ??
                                0xffffffff)
                            .withOpacity(1.0),
                      )
                    : ColorDot(
                        color: Color(
                            miIcons[widget.task.icon]?.colorCode ?? 0xffffffff),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: miDefaultSize * 0.4),
                child: CircularGradientIcon(
                  icon: miIcons[widget.task.icon],
                ),
              ),
            ],
          ),
          title: Text(
            widget.task.title,
            style: TextStyle(
              fontSize: miDefaultSize * 1.2,
              overflow: TextOverflow.ellipsis,
              color: miTextColor,
            ),
          ),
          trailing: widget.isMarkDoneScreen
              ? Checkbox(
                  value: _isChecked,
                  onChanged: (bool? val) => setState(() => _isChecked = val),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(miDefaultSize * 0.3),
                  ),
                )
              : Column(
                  children: [
                    Text(
                      DateFormat('d MMM').format(widget.task.schedule),
                      style: TextStyle(
                        fontFamily: "Lato Black",
                        fontSize: miDefaultSize * 1.2,
                        color: miTextBoldColor,
                      ),
                    ),
                    SizedBox(height: miDefaultSize - 4),
                    Text(
                      DateFormat.Hm().format(widget.task.schedule),
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