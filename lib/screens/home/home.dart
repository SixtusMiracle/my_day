import 'package:flutter/material.dart';
import 'package:my_day/shared/constants.dart';
import 'package:my_day/shared/util/circular_gradient_icon.dart';

import '../../shared/util/app_bar.dart';
import '../../shared/util/mi_bottom_app_bar.dart';
import 'components/body.dart';

class Home extends StatelessWidget {
  static String routeName = "/home";

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      extendBody: true,
      bottomNavigationBar: MiBottomAppBar(),
    );
  }
}
