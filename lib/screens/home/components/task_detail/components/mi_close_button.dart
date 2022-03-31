import 'package:flutter/material.dart';

import '../../../../../shared/constants.dart';

class MiCloseButton extends StatelessWidget {
  const MiCloseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: miDefaultSize * 1.5,
        vertical: miDefaultSize * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(miDefaultSize * 3),
        gradient: LinearGradient(
          begin: Alignment(1.22, -1.22),
          end: Alignment(-0.65, 1.52),
          colors: [const Color(0xff00ffff), const Color(0xff254dde)],
          stops: [0.0, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x4d00ffff),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: TextButton(
        child: const Text(
          'Close',
          style: TextStyle(
            fontFamily: "Baloo",
            fontSize: miDefaultSize * 1.5,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
