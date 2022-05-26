import 'package:flutter/material.dart';
import 'package:swile_test_technique/core/models/category.dart';
import 'package:swile_test_technique/ui/shared/theme/app_colors.dart';

////////////////////////////////////////// CATEGORIES MAPPING ////////////////////////////////////////////
/// The mapping between the categroy name returned by the API and the category class used in the app.

Map<String, Category> categoriesMap = {
  'payment': Category(name:'payment', color: primaryColor, icon: Icons.payment),
  'donation': Category(name:'donation', color: primaryColor, icon: Icons.payments),
  'supermarket' : Category(name:'supermarket', color:Color.fromARGB(255, 253, 165, 61), icon: Icons.shopping_bag_outlined),
  'bakery' : Category(name:'bakery', color:Color.fromARGB(255, 253, 165, 61), icon: Icons.bakery_dining_outlined),
  'burger' : Category(name:'burger', color:Color.fromARGB(255, 253, 165, 61), icon: Icons.lunch_dining_outlined),
  'train' : Category(name: 'train', color: Color.fromARGB(255, 252, 99, 106), icon: Icons.train_outlined),
  'computer' : Category(name:'computer', color: Color.fromARGB(255, 253, 153, 207), icon: Icons.computer),
  'sushi' : Category(name: 'sushi', color:Color.fromARGB(255, 253, 165, 61), icon: Icons.rice_bowl_outlined),
  'meal_voucher' : Category(name:'meal_voucher', color:Color.fromARGB(255, 253, 165, 61), icon: Icons.restaurant),
  'mobility' : Category(name:'mobility', color:Color.fromARGB(255, 252, 99, 106), icon: Icons.pedal_bike),
  'gift' : Category(name:'gift', color: Color.fromARGB(255, 253, 153, 207), icon: Icons.card_giftcard),
  'unknown' : Category(name:'unknown', color: Color.fromARGB(255, 253, 165, 61), icon: Icons.help_outline),
};