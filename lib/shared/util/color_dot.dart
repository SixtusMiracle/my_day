import 'package:flutter/material.dart';

import '../constants.dart';

class ColorDot extends StatelessWidget {
  /// Generates a dot
  ///
  /// [Color] **color** *required*

  const ColorDot({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: miDefaultSize * 0.65,
      width: miDefaultSize * 0.65,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
