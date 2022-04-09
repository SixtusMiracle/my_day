import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_day/models/task.dart';
import 'package:my_day/screens/calendar_mode/components/days_row.dart';

import '../../../providers/task_notifier.dart';
import '../../../shared/constants.dart';
import '../../../shared/task_detail/details_modal_dialog.dart';
import '../../../shared/util/background.dart';
import 'task_row.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ScrollController _datesController = ScrollController();
  List<int> days = List<int>.generate(totalDaysInMonth, (i) => i + 1);
  int selectedIndex = DateTime.now().day - 1;

  Future<void> _showDetailsModal({required Task task}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => DetailsModalDialog(task: task),
    );
  }

  void _scrollToSelectedIndex() {
    double initialScrollTarget = (selectedIndex * (miDefaultSize * 8));

    if (_datesController.hasClients) {
      _datesController.animateTo(initialScrollTarget,
          duration: Duration(milliseconds: 300), curve: Curves.elasticOut);
    } else {
      Timer(Duration(milliseconds: 400), () => _scrollToSelectedIndex());
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _scrollToSelectedIndex());

    return Background(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: miDefaultSize * 8,
            child: ListView.builder(
              controller: _datesController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: days.length,
              itemBuilder: (BuildContext context, int index) => DaysRow(
                index: index,
                selectedIndex: selectedIndex,
                days: days,
                tap: () => setState((() => selectedIndex = index)),
              ),
            ),
          ),
          SizedBox(height: miDefaultSize * 1.7),
          Consumer(builder: (context, outerRef, child) {
            final asyncTaskProvider =
                outerRef.watch(futureTaskNotifierProvider);

            return asyncTaskProvider.when(
              data: (data) => ProviderScope(
                overrides: [taskNotifierProvider.overrideWithValue(data)],
                child: Consumer(
                  builder: (context, ref, child) {
                    final tasks = ref.watch(taskNotifierProvider) as List<Task>;

                    return Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: tasks.length,
                        itemBuilder: (BuildContext context, int index) =>
                            TaskRow(
                          task: tasks[index],
                          tap: () => _showDetailsModal(task: tasks[index]),
                        ),
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
    );
  }
}
