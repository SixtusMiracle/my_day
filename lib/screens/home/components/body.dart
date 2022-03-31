import 'package:flutter/material.dart';
import 'package:my_day/models/todo.dart';
import 'package:my_day/shared/constants.dart';

import '../../../shared/util/background.dart';
import '../../task_detail/details_modal_dialog.dart';
import 'todo_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _showDetailsModal({required Todo todo}) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) => DetailsModalDialog(todo: todo),
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
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) => TodoCard(
                    todo: todos[index],
                    press: () => _showDetailsModal(todo: todos[index])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
