import 'package:flutter/material.dart';

import '../../shared/util/app_bar.dart';
import '../../shared/util/mi_bottom_app_bar.dart';
import 'components/body.dart';

class MarkDone extends StatelessWidget {
  /// This is where the users can
  /// mark done tasks from
  const MarkDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        hasActions: false,
        title: "MARK DONE TASKS",
        hasBackButton: true,
      ),
      body: Body(),
      extendBody: true,
      bottomNavigationBar: MiBottomAppBar(isMarkDoneScreen: true),
    );
  }
}
