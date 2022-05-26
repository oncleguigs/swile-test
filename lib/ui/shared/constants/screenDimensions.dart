import 'package:flutter/material.dart';

//////////////// HELPERS TO DEAL WITH SCREEN SIZE ////////////////

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double screenHeight(BuildContext context,
    {double dividedBy = 1, double reducedBy = 0.0}) {
  return (screenSize(context).height - reducedBy) / dividedBy;
}

double screenWidth(BuildContext context,
    {double dividedBy = 1, double reducedBy = 0.0}) {
  return (screenSize(context).width - reducedBy) / dividedBy;
}

double screenHeightExcludingToolbar(BuildContext context,
    {double dividedBy = 1}) {
  return screenHeight(context, dividedBy: dividedBy, reducedBy: kToolbarHeight);
}

double screenHeightExcludingViewPadding(BuildContext context,
    {double dividedBy = 1}) {
  return screenHeight(context, dividedBy: dividedBy, reducedBy: MediaQuery.of(context).viewPadding.top);
}