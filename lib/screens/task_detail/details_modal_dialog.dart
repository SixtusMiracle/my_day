import 'package:flutter/material.dart';

import '../../models/todo.dart';
import '../../shared/constants.dart';
import 'components/detail_title_card.dart';
import 'components/mi_close_button.dart';
import 'components/mi_content_box.dart';

class DetailsModalDialog extends StatelessWidget {
  final Todo todo;

  const DetailsModalDialog({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: DetailTitleCard(todo: todo),
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
            MiContentBox(description: todo.description),
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
