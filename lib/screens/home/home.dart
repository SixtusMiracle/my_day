import 'package:flutter/material.dart';

import '../../shared/util/app_bar.dart';
import 'components/body.dart';

class Home extends StatelessWidget {
  static String routeName = "/home";

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }
}
