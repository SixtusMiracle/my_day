import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_day/models/task.dart';
import 'package:my_day/providers/task_notifier.dart';
import 'package:my_day/shared/constants.dart';
import 'package:my_day/shared/util/loading.dart';
import 'package:my_day/shared/util/no_item.dart';

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
            Consumer(
              builder: (context, outerRef, child) {
                final asyncTaskProvider =
                    outerRef.watch(futureTaskNotifierProvider);

                return asyncTaskProvider.when(
                  data: (data) {
                    return ProviderScope(
                      overrides: [taskNotifierProvider.overrideWithValue(data)],
                      child: Consumer(
                        builder: (context, ref, child) {
                          final tasks =
                              ref.watch(taskNotifierProvider) as List<Task>;

                          return tasks.length == 0
                              ? NoItem(
                                  text:
                                      "No tasks! Tap on the plus icon on the lower right part of the screen to add a new task",
                                  isHomeScreen: true)
                              : Expanded(
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: tasks.length,
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            TaskCard(
                                                task: tasks[index],
                                                press: () => _showDetailsModal(
                                                    task: tasks[index])),
                                  ),
                                );
                        },
                      ),
                    );
                  },
                  error: (_, stack) => Center(child: Text(_.toString())),
                  loading: () => const Loading(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
