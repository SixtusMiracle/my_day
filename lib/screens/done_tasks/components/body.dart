import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_day/shared/util/background.dart';

import '../../../models/task.dart';
import '../../../providers/task_notifier.dart';
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
            Consumer(builder: (context, outerRef, child) {
              final asyncTaskProvider =
                  outerRef.watch(futureTaskNotifierProvider);

              return asyncTaskProvider.when(
                data: (data) => ProviderScope(
                  overrides: [taskNotifierProvider.overrideWithValue(data)],
                  child: Consumer(
                    builder: (context, ref, child) {
                      final tasks =
                          ref.watch(taskNotifierProvider) as List<Task>;

                      return Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: tasks.length,
                          itemBuilder: (BuildContext context, int index) =>
                              TaskCard(task: tasks[index], isDoneScreen: true),
                        ),
                      );
                    },
                  ),
                ),
                error: (_, stack) => Center(
                  child: Text(_.toString()),
                ),
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
