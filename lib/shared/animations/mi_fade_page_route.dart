import 'package:flutter/material.dart';

class MiFadePageRoute extends PageRouteBuilder {
  /// Applies a fade animation
  /// when naviating to a new screen.

  MiFadePageRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(opacity: animation, child: child),
        );

  final Widget page;
}
