import 'package:flutter/material.dart';
import 'package:swile_test_technique/ui/shared/constants/screenDimensions.dart';

//////////////////////////// FADING BACKGROUND ////////////////////////////
/// This is the background of the transaction details view.
/// It is a fading background.

class FadingBackground extends StatelessWidget {
  final Animation<double> animation;
  const FadingBackground({ Key? key, required this.animation }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation, 
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          child: child, 
          opacity: Tween<double>(
            begin: 0,
            end: 1
          ).animate(CurvedAnimation(
            parent: animation, 
            curve: Interval(0, 0.3, curve: Curves.decelerate)
          ))
        );
      },
      child: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        color: Colors.white,
      ),
    );
  }
}