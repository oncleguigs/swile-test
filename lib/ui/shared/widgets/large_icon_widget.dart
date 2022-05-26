import 'package:flutter/material.dart';
import 'package:swile_test_technique/core/models/transaction.dart';
import 'package:swile_test_technique/ui/shared/widgets/animated_rounded_icon.dart';

/////////////////////////// LARGE ICON WIDGET //////////////////////////
/// This is the large icon widget.
/// It displays the icon and its background, transiting nicely according to the figma animation.


class LargeIconWidget extends StatelessWidget {
  final double width;
  final double height;
  final Transaction transaction;
  final double rightOffset;
  final double radius;
  final double radiusTo;
  final double borderWidth;

  const LargeIconWidget({ 
    Key? key, 
    required this.width, 
    required this.height, 
    required this.transaction,
    this.radiusTo = 0,
    this.rightOffset = 0,
    this.radius = 0,
    this.borderWidth = 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right:rightOffset),
      child: AnimatedRoundedIcon(
        tag: '${transaction.name}${transaction.createdAt}_large_icon', 
        width: width,
        height: height,
        borderColor: transaction.largeIconCategory.color.withAlpha(20),
        backgroundColor: (transaction.largeIconUrl == null)?transaction.largeIconCategory.color.withAlpha(50):null,
        radiusTo: radiusTo,
        rightOffset: rightOffset,
        radius: radius,
        borderWidth: borderWidth,
        child: (transaction.largeIconUrl != null)?Image.network(transaction.largeIconUrl!, fit: BoxFit.cover,)
        : Icon(transaction.largeIconCategory.icon, size: height/2, color: transaction.largeIconCategory.color,)
      ),
    );
  }
}