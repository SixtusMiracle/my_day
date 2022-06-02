import 'package:flutter/material.dart';
import 'package:my_day/shared/util/app_bar.dart';

import 'components/body.dart';

class DoneTasks extends StatelessWidget {
  /// This widget displays all the [Task]
  /// that has the isDone property set to `true`

  const DoneTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        hasBackButton: true,
        hasActions: false,
        title: "DONE TASKS",
      ),
      body: Body(),
    );
  }
}
