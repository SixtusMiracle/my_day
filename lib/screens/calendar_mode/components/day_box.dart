import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shared/constants.dart';

class DayBox extends StatelessWidget {
  const DayBox({
    Key? key,
    required this.days,
    required this.index,
    required this.selectedIndex,
  }) : super(key: key);

  final List<int> days;
  final int index, selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${days[index]}",
          style: TextStyle(
            fontSize: selectedIndex == index
                ? miDefaultSize * 2
                : miDefaultSize * 1.5,
            color: selectedIndex == index ? Colors.white : miTextColor,
          ),
        ),
        SizedBox(height: miDefaultSize * 0.7),
        Text(
          DateFormat("E").format(
              DateTime(DateTime.now().year, DateTime.now().month, days[index])),
          style: TextStyle(
            fontSize:
                selectedIndex == index ? miDefaultSize * 1.3 : miDefaultSize,
            color: selectedIndex == index ? Colors.white : miTextColor,
          ),
        ),
      ],
    );
  }
}
