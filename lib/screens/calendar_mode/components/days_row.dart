import 'package:flutter/material.dart';

import '../../../../../shared/constants.dart';
import 'day_box.dart';

class DaysRow extends StatelessWidget {
  const DaysRow({
    Key? key,
    required this.index,
    required this.selectedIndex,
    required this.days,
    this.tap,
  }) : super(key: key);

  final int index, selectedIndex;
  final List<int> days;
  final Function()? tap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: selectedIndex == index
              ? miDefaultSize * 1.2
              : miDefaultSize * 1.8,
          horizontal:
              selectedIndex == index ? miDefaultSize * 3 : miDefaultSize * 2.2,
        ),
        decoration: selectedIndex == index
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(miDefaultSize),
                gradient: LinearGradient(
                  begin: Alignment(1.28, -1.43),
                  end: Alignment(-1.0, 1.38),
                  colors: [const Color(0xff00ffff), const Color(0xff254dde)],
                  stops: [0.0, 1.0],
                ),
              )
            : null,
        child: DayBox(
          days: days,
          index: index,
          selectedIndex: selectedIndex,
        ),
      ),
    );
  }
}
