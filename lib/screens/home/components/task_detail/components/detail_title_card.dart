import 'package:flutter/material.dart';
import 'package:my_day/models/mi_icon.dart';

import '../../../../../models/todo.dart';
import '../../../../../shared/constants.dart';
import '../../../../../shared/util/circular_gradient_icon.dart';
import 'schedule.dart';

class DetailTitleCard extends StatelessWidget {
  const DetailTitleCard({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFAFAFB),
      elevation: 0,
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(miDefaultSize),
      ),
      child: Padding(
        padding: const EdgeInsets.all(miDefaultSize * 1.5),
        child: Column(
          children: [
            CircularGradientIcon(
              icon: mi_icons[todo.icon],
              height: 48,
              width: 48,
            ),
            SizedBox(height: miDefaultSize * 1.4),
            Text(
              todo.title,
              style: TextStyle(
                fontSize: miDefaultSize * 1.3,
                fontWeight: FontWeight.bold,
                color: miTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: miDefaultSize * 0.45),
              child: Schedule(schedule: todo.schedule),
            ),
          ],
        ),
      ),
    );
  }
}
