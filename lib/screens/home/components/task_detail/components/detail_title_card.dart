import 'package:flutter/material.dart';

import '../../../../../models/task.dart';
import '../../../../../shared/constants.dart';
import '../../../../../shared/util/circular_gradient_icon.dart';
import 'schedule.dart';

class DetailTitleCard extends StatelessWidget {
  const DetailTitleCard({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

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
              icon: miIcons[task.icon],
              height: 48,
              width: 48,
            ),
            SizedBox(height: miDefaultSize * 1.4),
            Text(
              task.title,
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
              child: Schedule(schedule: task.schedule),
            ),
          ],
        ),
      ),
    );
  }
}
