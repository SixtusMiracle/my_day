import 'package:flutter/widgets.dart';
import 'package:my_day/screens/done_tasks/done_tasks.dart';
import 'package:my_day/screens/home/home.dart';

final Map<String, WidgetBuilder> routes = {
  Home.routeName: (context) => Home(),
  DoneTasks.routeName: (context) => DoneTasks(),
};
