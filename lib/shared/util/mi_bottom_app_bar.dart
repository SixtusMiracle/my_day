import 'package:flutter/material.dart';
import 'package:my_day/screens/mark_done/mark_done.dart';
import 'package:my_day/shared/animations/mi_fade_page_route.dart';

import '../../screens/home/components/new_task/mi_new_task_sidebar.dart';
import '../constants.dart';
import 'circular_gradient_icon.dart';

class MiBottomAppBar extends StatelessWidget {
  const MiBottomAppBar({
    Key? key,
    this.markDoneScreen = false,
  }) : super(key: key);

  final bool markDoneScreen;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.only(bottom: miDefaultSize * 1.2),
        child: Row(
          mainAxisAlignment: markDoneScreen
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceEvenly,
          children: markDoneScreen
              ? <Widget>[
                  CircularGradientIcon(
                    icon: miIcons["times"],
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x4d181743),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                    press: () => Navigator.pop(context),
                    height: 90,
                    width: 90,
                    markDoneScreen: true,
                    allPadding: miDefaultSize * 2.5,
                  ),
                  SizedBox(width: miDefaultSize * 1.5),
                  CircularGradientIcon(
                    icon: miIcons["double_tick"],
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x4dfe1e9a),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                    press: () {},
                    height: 90,
                    width: 90,
                    markDoneScreen: true,
                    allPadding: miDefaultSize * 2.1,
                  ),
                ]
              : <Widget>[
                  CircularGradientIcon(
                    icon: miIcons["tick"],
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xCEA3A108),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                    press: () => Navigator.push(
                        context, MiFadePageRoute(page: MarkDone())),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: miDefaultSize * 1.3),
                    child: CircularGradientIcon(
                      icon: miIcons["calendar"],
                      height: 70,
                      width: 70,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x33181743),
                          offset: Offset(0, 4),
                          blurRadius: 6,
                        ),
                      ],
                      color: null,
                      press: () {},
                    ),
                  ),
                  CircularGradientIcon(
                    icon: miIcons["plus"],
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x4d00ffff),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                    press: () {
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: 'Label',
                        pageBuilder: (
                          BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                        ) {
                          return Align(
                            alignment: Alignment.centerRight,
                            child: MiNewTaskSidebar(),
                          );
                        },
                      );
                    },
                  ),
                ],
        ),
      ),
    );
  }
}
