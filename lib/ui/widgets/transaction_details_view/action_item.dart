import 'package:flutter/material.dart';
import 'package:swile_test_technique/ui/shared/constants/screenDimensions.dart';
import 'package:swile_test_technique/ui/shared/widgets/animated_rounded_icon.dart';

////////////////////////////// THE ACTION ITEM WIDGET //////////////////////////
/// This is the action item widget.
/// Made of a rown with a rounded icon, the action description text
/// It can also have a child action at the end of the row

class ActionItem extends StatelessWidget {
  final Widget? child;
  final displayBorders;
  final String text;
  final IconData? icon;
  final Color? iconColor;
  final String? url;
  //final Function onTap;                                 TO BE IMPLEMENTED, the function to be called when the action item is tapped

  const ActionItem({ Key? key, 
    this.child, 
    required this.text, 
    this.icon, 
    this.iconColor, 
    this.displayBorders = true,
    this.url
  }) : super(key: key);

  final double _iconSize = 24;
  final double _iconMargin = 12;
  final double _iconPadding = 8;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: screenWidth(context),
      child: InkWell(
        onTap: (){
          // onTap(); 
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedRoundedIcon(
              width: _iconSize + _iconPadding, 
              height: _iconSize + _iconPadding, 
              borderColor: iconColor??Colors.transparent,
              radiusTo: _iconPadding*1.5,
              backgroundColor:(iconColor != null)?iconColor!.withAlpha(50):Colors.transparent, 
              child: (icon != null)?Icon(icon, color: iconColor, size: _iconSize):Image.network(url!, fit: BoxFit.cover,),
            ),
            SizedBox(width: _iconMargin),
            Expanded(
              child: Container(
                height: 56,
                decoration: (displayBorders)?BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color.fromARGB(140, 218, 218, 218), width: 1),
                  ),
                ):null,
                child: Row(
                  children: [
                    Text(text, style: Theme.of(context).textTheme.bodyText1),
                    Spacer(),
                    SizedBox(
                      child: child??Container()
                    )
                  ]
                )
              )
            )
          ],
        ),
      )
    );
  }
}