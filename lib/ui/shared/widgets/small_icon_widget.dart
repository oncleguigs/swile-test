import 'package:flutter/material.dart';
import 'package:swile_test_technique/core/models/transaction.dart';

////////////////////////// SMALL ICON WIDGET //////////////////////////
/// This is the small icon widget.
/// It displays the small icon and its background, transiting nicely according to the figma animation.

class SmallIconWidget extends StatelessWidget {
  final Transaction transaction;
  final double size;

  const SmallIconWidget({ Key? key, required this.transaction, this.size = 16}) : super(key: key);

  final double radius = 50;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${transaction.name}${transaction.createdAt}_small_icon', 
      child: CircleAvatar(
        backgroundColor: Theme.of(context).canvasColor,
        radius: size/1.8,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          child: (transaction.smallIconUrl != null)
            ?Image.network(transaction.smallIconUrl!, 
              width: size - 5,
              height: size - 5,)
            : Icon(transaction.smallIconCategory.icon, 
              color: transaction.smallIconCategory.color,
              size: size - 5,)
        )
      )
    );
  }
}