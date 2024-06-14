import 'package:flutter/material.dart';

class SlideFromRightRoute extends PageRouteBuilder {
  final Widget? page;
  final Duration duration;
  @override
  final RouteSettings settings;
  SlideFromRightRoute({required this.settings, this.page, this.duration = const Duration(milliseconds: 1000)})
      : super(
            settings: settings,
            pageBuilder: (context, animation, anotherAnimation) => page!,
            transitionDuration: duration,
            reverseTransitionDuration: const Duration(milliseconds: 340),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(curve: Curves.fastLinearToSlowEaseIn, parent: animation, reverseCurve: Curves.fastOutSlowIn);
              return SlideTransition(position: Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0)).animate(animation), child: page);
            });
}
