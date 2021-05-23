import 'package:flutter/material.dart';

class HoverLift extends StatefulWidget {
  HoverLift({
    Key? key,
    required this.child,
    this.endScale = 1.1,
  }) : super(key: key);

  final Widget child;
  final double endScale;

  @override
  _HoverLiftState createState() => _HoverLiftState();
}

class _HoverLiftState extends State<HoverLift>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: _HoverLiftAnimation(
        controller: _controller,
        child: widget.child,
        endScale: widget.endScale,
      ),
    );
  }
}

class _HoverLiftAnimation extends AnimatedWidget {
  _HoverLiftAnimation({
    Key? key,
    required this.child,
    required AnimationController controller,
    required this.endScale,
  }) : super(key: key, listenable: controller);

  final Widget child;
  final double endScale;

  @override
  Widget build(BuildContext context) {
    final _scale = Tween<double>(begin: 1.0, end: endScale);
    final controller = listenable as AnimationController;
    return Transform.scale(
      scale: _scale.animate(controller).value,
      child: child,
    );
  }
}
