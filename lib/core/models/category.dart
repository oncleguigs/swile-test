import 'package:flutter/cupertino.dart';

////////////////////////////////////////CATEGORY CLASS/////////////////////////////////////////////////
/// Matching the category sendt by the API

class Category {
  final Color color;                                  // The color of the category
  final String name;                                  // The name of the category
  final IconData? icon;                               // The icon of the category
  final String? url;                                  // The url of the category

  Category({required this.color, required this.name, this.icon, this.url});

}