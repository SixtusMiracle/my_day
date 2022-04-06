import 'package:flutter/material.dart';
import 'package:my_day/shared/util/background.dart';

import '../../../models/task.dart';
import '../../../shared/constants.dart';
import '../../../shared/util/task_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: miDefaultSize * 1.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: miDefaultSize * 2.3),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) =>
                    TaskCard(task: tasks[index], isDoneScreen: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
