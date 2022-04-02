import 'package:flutter/material.dart';

import '../../../../models/task.dart';
import '../../../../shared/constants.dart';
import 'components/detail_title_card.dart';
import 'components/mi_close_button.dart';
import 'components/mi_content_box.dart';

class DetailsModalDialog extends StatelessWidget {
  final Task task;

  const DetailsModalDialog({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: DetailTitleCard(task: task),
      titlePadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(miDefaultSize),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 0,
        horizontal: miDefaultSize * 1.3,
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: miDefaultSize,
              ),
              child: Text(
                "Description",
                style: TextStyle(
                  fontFamily: "Lato Black",
                  color: miTextBoldColor,
                ),
              ),
            ),
            MiContentBox(description: task.description),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MiCloseButton(),
          ],
        ),
      ],
    );
  }
}
