import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_day/models/task.dart';
import 'package:my_day/screens/calendar_mode/components/days_row.dart';
import 'package:my_day/shared/util/loading.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
  final dateScrollController = ItemScrollController();
  List<int> days = [];
  int selectedIndex = 0;

  Future<void> _showDetailsModal({required Task task}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => DetailsModalDialog(task: task),
    );
  }

  void _scrollToSelectedIndex({required int index}) {
    dateScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.elasticOut,
    );
  }

  @override
  void initState() {
    super.initState();
    days = List<int>.generate(totalDaysInMonth, (i) => i + 1);
    selectedIndex = days.indexWhere((day) => day == DateTime.now().day);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => _scrollToSelectedIndex(index: selectedIndex));

    DateTime _selectedDateTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      days[selectedIndex],
    );

    return Background(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: miDefaultSize * 8,
            child: ScrollablePositionedList.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemScrollController: dateScrollController,
              itemCount: days.length,
              itemBuilder: (BuildContext context, int index) => DaysRow(
                index: index,
                selectedIndex: selectedIndex,
                days: days,
                tap: () => setState((() => selectedIndex = index)),
              ),
            ),
          ),
          const SizedBox(height: miDefaultSize * 1.7),
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
                    final tasksForToday = allTasks
                        .where((Task task) =>
                            (task.schedule.month == DateTime.now().month) &&
                            (task.schedule.day == days[selectedIndex]))
                        .toList();

                    return tasksForToday.isEmpty
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: miDefaultSize,
                              vertical: miDefaultSize * 9,
                            ),
                            child: Wrap(
                              children: [
                                Text(
                                  "No tasks for",
                                  style: TextStyle(
                                    fontFamily: "Lato Black",
                                    color: Colors.purple,
                                    fontSize: miDefaultSize * 3,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(width: miDefaultSize * 0.8),
                                Text(
                                  DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              DateTime.now().day) ==
                                          _selectedDateTime
                                      ? "today"
                                      : DateFormat("E, MMM d")
                                          .format(_selectedDateTime),
                                  style: TextStyle(
                                    fontFamily: "Lato Black",
                                    color: Colors.purple,
                                    fontSize: miDefaultSize * 3,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: tasksForToday.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  TaskRow(
                                task: tasksForToday[index],
                                tap: () => _showDetailsModal(
                                    task: tasksForToday[index]),
                              ),
                            ),
                          );
                  },
                ),
              ),
              error: (_, stack) => Center(
                child: Text(_.toString()),
              ),
              loading: () => const Loading(),
            );
          }),
        ],
      ),
    );
  }
}
