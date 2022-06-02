import 'package:flutter/material.dart';

import '../../../../../shared/constants.dart';
import '../../../../../shared/util/circular_gradient_icon.dart';
import '../../../../../shared/util/color_dot.dart';

class IconsRow extends StatelessWidget {
  /// This widget is the icons carousel

  const IconsRow({
    Key? key,
    required this.index,
    required this.selectedIndex,
    required this.icons,
    this.tap,
  }) : super(key: key);

  final int index;
  final int selectedIndex;
  final List<String> icons;
  final Function()? tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Padding(
        padding: const EdgeInsets.only(right: miDefaultSize * 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: miDefaultSize * 0.5),
              child: ColorDot(
                color: selectedIndex == index
                    ? Color(miIcons[icons[index]]?.colorCode ?? 0xffffffff)
                    : Colors.transparent,
              ),
            ),
            CircularGradientIcon(
              icon: miIcons[icons[index]],
              isActive: selectedIndex == index ? true : false,
            ),
          ],
        ),
      ),
    );
  }
}
