import 'package:flutter/material.dart';
import 'package:my_day/models/task.dart';
import 'package:my_day/shared/constants.dart';

import '../../../shared/task_detail/details_modal_dialog.dart';
import '../../../shared/util/background.dart';
import '../../../shared/util/task_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _showDetailsModal({required Task task}) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) => DetailsModalDialog(task: task),
      );
    }

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
                itemBuilder: (BuildContext context, int index) => TaskCard(
                    task: tasks[index],
                    press: () => _showDetailsModal(task: tasks[index])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
