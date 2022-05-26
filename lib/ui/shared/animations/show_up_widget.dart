import 'package:flutter/material.dart';

///////////////////////////////// SHOW UP WIDGET /////////////////////////////////////////////////
/// This widget is used to animate a widget that is not visible when the widget is first created
/// The animation is a fade in animation and a slide up animation from the bottom

class ShowUpWidget extends StatelessWidget {
  final Widget? child;
  final Animation<double> animation;
  final double begin;
  final double end;
  const ShowUpWidget({ Key? key, required this.child, required this.animation, this.begin = 0, this.end = 1 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation, 
      builder: (BuildContext context, Widget? child) {
        return  FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1
          ).animate(CurvedAnimation(
            parent: animation, 
            curve: Interval(begin, end, curve: Curves.decelerate)
          )),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, 1),
              end: Offset(0,0)
            ).animate(
              CurvedAnimation(
                parent: animation, 
                curve: Interval(begin, end, curve: Curves.decelerate)
              )
            ),
            child: child,
          )
        );
      },
      child: child
    );
  }
}