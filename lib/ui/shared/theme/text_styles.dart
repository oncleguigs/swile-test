import 'package:flutter/material.dart';
import 'package:swile_test_technique/ui/shared/theme/app_colors.dart';

//////////////// TEXT STYLES OF THE APP //////////////
/// These are the textstyles used in the app.
/// It defines the text styles.

TextTheme textStyles = TextTheme(
  headline1 : TextStyle(fontSize: 34, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, color: primaryColor, letterSpacing: 0.25),
  bodyText1: TextStyle(fontSize: 15, fontStyle: FontStyle.normal, color: primaryColor,),
  bodyText2: TextStyle(fontSize: 13, fontStyle: FontStyle.normal, color: primaryColor),
  button: TextStyle(fontSize: 12, fontStyle: FontStyle.normal, color: hintColor, fontWeight: FontWeight.w600),
);