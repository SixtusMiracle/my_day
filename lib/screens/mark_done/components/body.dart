import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_day/models/task.dart';
import 'package:my_day/providers/task_notifier.dart';
import 'package:my_day/shared/util/background.dart';
import 'package:my_day/shared/util/task_card.dart';

import '../../../shared/constants.dart';

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
            Consumer(builder: (context, outerRef, child) {
              final asyncTaskProvider =
                  outerRef.watch(futureTaskNotifierProvider);

              return asyncTaskProvider.when(
                data: (data) => ProviderScope(
                  overrides: [taskNotifierProvider.overrideWithValue(data)],
                  child: Consumer(
                    builder: (context, ref, child) {
                      final allTasks =
                          ref.watch(taskNotifierProvider) as List<Task>;
                      final undoneTasks = allTasks
                          .where((Task task) => task.isDone == false)
                          .toList();

                      return Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: undoneTasks.length,
                          itemBuilder: (BuildContext context, int index) =>
                              TaskCard(
                            task: undoneTasks[index],
                            isMarkDoneScreen: true,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                error: (_, stack) => Center(child: Text(_.toString())),
                loading: () =>
                    const Center(child: CircularProgressIndicator.adaptive()),
              );
            }),
          ],
        ),
      ),
    );
  }
}
