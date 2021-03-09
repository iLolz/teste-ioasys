import 'dart:math';

import 'package:flutter/material.dart';

/// Show radial progress
class AppAnimatedRadialProgress extends StatefulWidget {
  ///Constructor
  final double size;
  final int animationConstant;
  final String assetDirectory;
  const AppAnimatedRadialProgress(
      {Key key,
      this.size = 55.0,
      this.animationConstant = 2,
      @required this.assetDirectory})
      : super(key: key);

  @override
  _AppAnimatedRadialProgressState createState() =>
      _AppAnimatedRadialProgressState();
}

class _AppAnimatedRadialProgressState extends State<AppAnimatedRadialProgress>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1500))
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * widget.animationConstant * pi,
          child: Image.asset(widget.assetDirectory),
        );
      },
    );
  }
}
