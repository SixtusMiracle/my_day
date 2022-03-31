import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/todo.dart';
import '../../../shared/constants.dart';
import '../../../shared/util/circular_gradient_icon.dart';
import '../../../shared/util/color_dot.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final Function()? press;

  const TodoCard({
    Key? key,
    required this.todo,
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
                child: ColorDot(color: Color(todo.colorCode)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: miDefaultSize * 0.4),
                child: CircularGradientIcon(
                  icon: todo.icon,
                  gradientStartColor: todo.gradientStartColor,
                  gradientStopColor: todo.gradientStopColor,
                  beginStart: todo.beginStart,
                  beginStop: todo.beginStop,
                  endStart: todo.endStart,
                  endStop: todo.endStop,
                ),
              ),
            ],
          ),
          title: Text(
            todo.title,
            style: TextStyle(
              fontSize: miDefaultSize * 1.2,
              overflow: TextOverflow.ellipsis,
              color: miTextColor,
            ),
          ),
          trailing: Column(
            children: [
              Text(
                DateFormat('d MMM').format(todo.schedule),
                style: TextStyle(
                  fontFamily: "Lato Black",
                  fontSize: miDefaultSize * 1.2,
                  color: miTextBoldColor,
                ),
              ),
              SizedBox(height: miDefaultSize - 4),
              Text(
                DateFormat.Hm().format(todo.schedule),
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
