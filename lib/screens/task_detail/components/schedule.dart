import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shared/constants.dart';

class Schedule extends StatelessWidget {
  const Schedule({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  final DateTime schedule;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          DateFormat('d MMM').format(schedule),
          style: TextStyle(
            fontFamily: "Lato Black",
            fontSize: miDefaultSize * 1.2,
            color: miTextBoldColor,
          ),
        ),
        SizedBox(width: miDefaultSize * 0.5),
        Text(
          DateFormat.Hm().format(schedule),
          style: TextStyle(
            fontFamily: "Lato Light",
            fontSize: miDefaultSize * 1.2,
            color: miTextColor,
          ),
        ),
      ],
    );
  }
}
