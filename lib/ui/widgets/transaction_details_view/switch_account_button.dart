import 'package:flutter/material.dart';

/////////////////////// SWITCH ACCOUNT BUTTON //////////////////////////
/// This is the button used to switch account.
/// It is used in the transaction details view inside the action list.

class SwitchAccountButton extends StatelessWidget {
  const SwitchAccountButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Text('Changer\nde compte', 
        style: Theme.of(context).textTheme.button,
        textAlign: TextAlign.right,
      )
    );
  }
}