import 'package:flutter/material.dart';

import '../../../../../shared/constants.dart';

class MiContentBox extends StatelessWidget {
  const MiContentBox({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Text(
          description,
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: miDefaultSize * 1.15,
            color: const Color(0xff95989a),
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
