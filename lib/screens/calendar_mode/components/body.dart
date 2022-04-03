import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_day/models/task.dart';
import 'package:my_day/screens/calendar_mode/components/days_row.dart';

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
  List<int> days = [19, 20, 21, 22, 23, 24, 25];
  int selectedIndex = 2;

  Future<void> _showDetailsModal({required Task task}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => DetailsModalDialog(task: task),
    );
  }

  void _scrollToSelectedIndex() {
    double initialScrollTarget =
        (selectedIndex * (miDefaultSize * 8)) / tasks.length;

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
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return TaskRow(
                  task: tasks[index],
                  tap: () => _showDetailsModal(task: tasks[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
