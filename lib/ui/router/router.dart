import 'package:flutter/material.dart';
import 'package:swile_test_technique/core/constants/routes_names.dart';
import 'package:swile_test_technique/ui/views/transaction_details_view.dart';

///////////////////////// THE APP ROUTER //////////////////////////
/// This is the app router.
/// It build the view and their transitions from the routes names.

class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    print("calling router : ");
    print(settings);
    Map args=(settings.arguments != null)?settings.arguments as Map:{};
  
    switch (settings.name) {
      case transactionDetailsViewRoute:{
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => TransactionDetailsView(
            transaction: args['transaction'],
            animation: animation
          ),
          transitionDuration: Duration(milliseconds: 800),
          reverseTransitionDuration: Duration(milliseconds: 400),
        );
      }
    }
    throw('could not find a matching route');
  }
}