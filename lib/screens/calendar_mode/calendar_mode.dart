import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/util/app_bar.dart';
import '../../shared/util/mi_bottom_app_bar.dart';
import 'components/body.dart';

class CalendarMode extends StatelessWidget {
  /// This widget is a calendar mode
  /// version of the home screen

  const CalendarMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          context: context, title: DateFormat("MMMM y").format(DateTime.now())),
      body: Body(),
      extendBody: true,
      bottomNavigationBar: MiBottomAppBar(
        isCalendarMode: true,
      ),
    );
  }
}
