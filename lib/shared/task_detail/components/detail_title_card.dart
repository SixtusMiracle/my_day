import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_day/services/task_service.dart';
import 'package:my_day/shared/util/loading.dart';

import '../../../../../models/task.dart';
import '../../../../../shared/constants.dart';
import '../../../../../shared/util/circular_gradient_icon.dart';
import '../../../providers/task_notifier.dart';
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
              child: Consumer(
                builder: (context, outerRef, child) {
                  final asyncTaskProvider =
                      outerRef.watch(futureTaskNotifierProvider);

                  return asyncTaskProvider.when(
                    data: (data) {
                      return ProviderScope(
                        overrides: [
                          taskNotifierProvider.overrideWithValue(data)
                        ],
                        child: Consumer(
                          builder: (context, ref, child) {
                            final tasksProvider =
                                ref.watch(taskNotifierProvider.notifier);

                            return Schedule(
                              schedule: task.schedule,
                              press: () async {
                                TaskService _taskService = TaskService();
                                int taskId = task.id;

                                String result = await _taskService
                                    .deleteTaskFromDatabase(taskId);

                                if (result == "success") {
                                  tasksProvider.removeTask(taskId);
                                  Navigator.pop(context);
                                } else {
                                  throw ("failed to delete");
                                }
                              },
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
            ),
          ],
        ),
      ),
    );
  }
}
