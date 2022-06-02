import 'package:flutter/material.dart';

import '../../shared/util/app_bar.dart';
import '../../shared/util/mi_bottom_app_bar.dart';
import 'components/body.dart';

class Home extends StatelessWidget {
  /// This widget is the default home screen
  ///
  /// It displays a [List] of all the [Task]

  const Home({Key? key}) : super(key: key);

  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context),
      body: Body(),
      extendBody: true,
      bottomNavigationBar: MiBottomAppBar(),
    );
  }
}
