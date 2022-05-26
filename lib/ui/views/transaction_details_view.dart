import 'package:flutter/material.dart';
import 'package:swile_test_technique/core/models/transaction.dart';
import 'package:swile_test_technique/core/services/services_locator.dart';
import 'package:swile_test_technique/core/viewModels/transactions_view_model.dart';
import 'package:swile_test_technique/ui/shared/animations/show_up_widget.dart';
import 'package:swile_test_technique/ui/shared/constants/screenDimensions.dart';
import 'package:swile_test_technique/ui/shared/widgets/large_icon_widget.dart';
import 'package:swile_test_technique/ui/shared/widgets/naviguation/back_arrow.dart';
import 'package:swile_test_technique/ui/shared/widgets/small_icon_widget.dart';
import 'package:swile_test_technique/ui/widgets/transaction_details_view/actions_list.dart';
import 'package:swile_test_technique/ui/widgets/transaction_details_view/fading_background.dart';
import 'package:swile_test_technique/ui/widgets/transaction_details_view/transaction_headline.dart';


/////////////////////// THE TRANSACTION DETAILS VIEW PAGE ///////////////////////
/// Implementing the transaction details page
/// Display the details of the previously selected transaction 
/// We use a Stateful widget because we extend TickerProvider
/// to trigger animations after the page is loaded

class TransactionDetailsView extends StatefulWidget {

  final Transaction transaction;
  final Animation<double> animation;

  const TransactionDetailsView({ Key? key, required this.animation, required this.transaction}) : super(key: key);

  @override
  State<TransactionDetailsView> createState() => _TransactionDetailsViewState();
}

class _TransactionDetailsViewState extends State<TransactionDetailsView> with TickerProviderStateMixin{
  
  final double _pagePadding = 20;
  final double _padding = 50;                               // the padding for elements positionning
  final double _headingHeight = 224 + kToolbarHeight;       // Height of the heading
  final double _smallIconSize = 24;                         // Size of the small icon
  final int _delay = 800;                                   // Delay before playing the animations
  final int _delayExit = 200;  
  final int _animationsDuration = 1400;                     // Total duration of animations
  final int _aniamtionsExitDuration = 400;                  // Total duration of the exit animation
  final double _spacing = 24;
  late final AnimationController _animationController;

  TransactionsViewModel model = serviceLocator<TransactionsViewModel>();

  @override
  void initState() {

    super.initState();
    _animationController = AnimationController(               // set up animation controller
      duration: Duration(milliseconds: _animationsDuration),  // set up duration of all animations
      vsync: this,
    );

    Future.delayed(Duration(milliseconds: _delay), () {       // delay the start of the animations until the hero finished transitioning
      _animationController.forward();                         // start the animations
      _animationController..duration = Duration(milliseconds: _aniamtionsExitDuration); // set the duration of the exit animations to be shorter
    });

  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: ()async{
        await _animationController.reverse();
        await Future.delayed(Duration(milliseconds: _delayExit));
        return true;
      },
      child: Material(
        color: Colors.transparent,
        child: Stack(
            children: [
              FadingBackground(animation: widget.animation,), // the white backgroung with the fading effect
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LargeIconWidget(
                    transaction: widget.transaction, 
                    width: screenWidth(context), 
                    height: _headingHeight, 
                    radius: 50 ,
                    radiusTo: 0
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:_pagePadding, right:_pagePadding),
                    child: Column(
                      children: [
                        SizedBox(height: _spacing),
                        ShowUpWidget(
                          child: TransactionHeadline(),  
                          animation: _animationController,
                          begin: 0.0,
                          end: 0.35,
                        ),
                        SizedBox(height: _spacing),
                        ShowUpWidget(
                          child: ActionsList(),  
                          animation: _animationController,
                          begin: 0.45,
                          end: 0.8,
                          
                        ),
                        SizedBox()
                      ],
                    )
                  )
                ],
              ),
              Positioned(
                top: _headingHeight-_smallIconSize/2,
                right: _padding,
                child: SmallIconWidget(transaction: widget.transaction, size: _smallIconSize,)
              ),
              Positioned(
                left: _padding/2,
                top: _padding,
                child: ShowUpWidget(
                  child: BackArrow(
                    beforePop:_animationController.reverse,    // the back arrow, plays animations in reverse before popping  
                    delayBeforePop: _delayExit,
                  ),
                  animation: _animationController,
                  begin: 0.0,
                  end: 0.35,
                ),
              )
            ]
          
        )
      ), 
    );
  }
}
