import 'package:flutter/material.dart';
import 'package:swile_test_technique/core/utililties/generate_random_string.dart';
import 'package:swile_test_technique/ui/shared/animations/animated%20_clipRRect.dart';

/////////////////////////// ANIMATED ROUNDED ICON //////////////////////////
/// This is the animated rounded icon widget.
/// It is used to animate the icon by re-using the animatedClipRRect widget.

class AnimatedRoundedIcon extends StatelessWidget {
  final double width;
  final double height;
  final double rightOffset;
  final double radius;
  final double radiusTo;
  final double borderWidth;
  final Color borderColor;
  final Color? backgroundColor;
  final Widget child;
  final String? tag;

  const AnimatedRoundedIcon({ 
    Key? key, 
    required this.width, 
    required this.height, 
    required this.borderColor,
    required this.child,
    this.tag,
    this.backgroundColor = const Color.fromARGB(255, 224, 224, 224),
    this.radiusTo = 0,
    this.rightOffset = 0,
    this.radius = 0,
    this.borderWidth = 0
  }) : super(key: key);

  static Tween<Rect?> _createRectTween(Rect? begin, Rect? end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag??generateRandomString(32),
      createRectTween: _createRectTween,
      child: AnimatedClipRRect(
        duration: Duration(milliseconds: 400),
        borderRadiusFrom: BorderRadius.all(Radius.circular(radius)),
        borderRadiusTo: BorderRadius.all(Radius.circular(radiusTo)),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(radiusTo)),
            border: Border.all(width: borderWidth, color: borderColor)
          ),
          child: child
        )   
      )
    );
  }
}