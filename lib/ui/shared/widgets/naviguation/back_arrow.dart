import 'package:flutter/material.dart';

/////////////////////////// THE BACK ARROW WIDGET //////////////////////////
/// This is the back arrow widget used in the app to go back to the previous page.

class BackArrow extends StatelessWidget {

  final Function? beforePop;
  final int delayBeforePop;

  const BackArrow({ Key? key, this.beforePop, this.delayBeforePop = 0 }) : super(key: key);
  
  final double _iconSize = 32;

  @override
  Widget build(BuildContext context){
    return InkWell(
      child: Icon(Icons.keyboard_arrow_down_sharp, size: _iconSize,),
      onTap: ()async{
        if(beforePop != null){
          await beforePop!();
        }
        await Future.delayed(Duration(milliseconds: delayBeforePop));
        Navigator.pop(context);
      },
    );
  }
}