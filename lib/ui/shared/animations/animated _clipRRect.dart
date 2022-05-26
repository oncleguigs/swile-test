import 'package:flutter/material.dart';

////////////////////////// ANIMATED CLIPRRECT WIDGET //////////////////////////
/// This widget is used to animate a cliprrect widget
/// We need it for the nice animation, because the hero border radius doesnt support animation

class AnimatedClipRRect extends StatelessWidget {
  AnimatedClipRRect({
    required this.duration,
    this.curve = Curves.linear,
    required this.borderRadiusFrom,                                     // The border radius of the widget before the animation
    required this.borderRadiusTo,                                       // The border radius of the widget after the animation
    required this.child,
    Key? key,
  }) : super(key: key);

  final Duration duration;
  final Curve curve;
  final BorderRadius borderRadiusFrom;
  final BorderRadius borderRadiusTo;
  final Widget child;
  bool alreadyAnimated = false;                                           // This is used to make sure we dont animate the widget twice

  static Widget _builder(
      BuildContext context, BorderRadius radius, Widget? child) {
    return ClipRRect(borderRadius: radius, child: child);
  }

  @override
  Widget build(BuildContext context) {

    return TweenAnimationBuilder<BorderRadius>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: (!alreadyAnimated)?borderRadiusFrom:borderRadiusTo, end: borderRadiusTo),
      builder: _builder,
      child: child,
      onEnd: (){alreadyAnimated = true;},
    );
  }
}