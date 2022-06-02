import 'package:flutter/material.dart';

class MiSlideLeftPageRoute extends PageRouteBuilder {
  /// Applies a left slide animation
  /// when naviating to a new screen.

  MiSlideLeftPageRoute({required this.page})
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
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );

  final Widget page;
}
