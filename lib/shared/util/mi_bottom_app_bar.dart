import 'package:flutter/material.dart';

import '../../screens/home/components/new_task/mi_new_task_sidebar.dart';
import '../constants.dart';
import 'circular_gradient_icon.dart';

class MiBottomAppBar extends StatelessWidget {
  const MiBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.only(bottom: miDefaultSize * 1.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircularGradientIcon(
              icon: "assets/icons/tick.svg",
              gradientStartColor: 0xFFFFFB01,
              gradientStopColor: 0xFF067017,
              beginStart: -0.8,
              beginStop: 0.81,
              endStart: 1.2,
              endStop: -1.23,
              boxShadow: [
                BoxShadow(
                  color: const Color(0x4dfe1e9a),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
              press: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: miDefaultSize * 1.3),
              child: CircularGradientIcon(
                icon: "assets/icons/calendar.svg",
                gradientStartColor: 0xffffffff,
                gradientStopColor: 0xffffffff,
                beginStart: -0.8,
                beginStop: 0.81,
                endStart: 1.2,
                endStop: -1.23,
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
              icon: "assets/icons/plus.svg",
              gradientStartColor: 0xFF020202,
              gradientStopColor: 0xFF01E1FF,
              beginStart: 1.22,
              beginStop: -1.22,
              endStart: -0.65,
              endStop: 1.52,
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
