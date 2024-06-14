import 'package:flutter/material.dart';

class FadeRoute extends PageRouteBuilder {
  final Widget? page;
  final Duration duration;

  @override
  final RouteSettings settings;

  FadeRoute({required this.settings, this.page, this.duration = const Duration(milliseconds: 300)})
      : super(
          settings: settings,
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => page!,
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => FadeTransition(opacity: animation, child: page),
        );
}
