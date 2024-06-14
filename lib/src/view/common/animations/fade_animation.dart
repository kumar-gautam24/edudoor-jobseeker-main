import 'package:flutter/material.dart';

class AnimatedFade extends StatefulWidget {
  final Widget child;
  final Duration duration; // Default duration
  final Curve curve; // Default curve

  const AnimatedFade({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 900),
    this.curve = Curves.easeIn,
  });

  @override
  State<AnimatedFade> createState() => _AnimatedFadeState();
}

class _AnimatedFadeState extends State<AnimatedFade> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _opacityAnimation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: _opacityAnimation.value < 1,
      child: AnimatedBuilder(
        animation: _opacityAnimation,
        builder: (context, child) {
          return Opacity(
            opacity: _opacityAnimation.value,
            child: widget.child,
          );
        },
      ),
    );
  }
}
