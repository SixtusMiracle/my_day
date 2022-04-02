import 'package:flutter/material.dart';

import '../../../../../shared/constants.dart';

class MiFormLabel extends StatelessWidget {
  const MiFormLabel({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Lato Black",
        fontSize: miDefaultSize * 1.8,
        color: miTextBoldColor.withOpacity(0.5),
      ),
    );
  }
}
