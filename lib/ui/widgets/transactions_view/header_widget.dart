import 'package:flutter/material.dart';

////////////////////////// HEADER WIDGET //////////////////////////
/// The heading widget at the top of the transactions view

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text('Titres-resto', style: Theme.of(context).textTheme.headline1,)
    );
  }
}