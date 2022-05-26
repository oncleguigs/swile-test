import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:provider/provider.dart';
import 'package:swile_test_technique/core/services/services_locator.dart';
import 'package:swile_test_technique/core/viewModels/transactions_view_model.dart';
import 'package:swile_test_technique/ui/shared/constants/screenDimensions.dart';

////////////////////// TRANSACTIONS VIEW ///////////////////////
/// Implementing the transactions history list

class TransactionsView extends StatelessWidget {
  TransactionsView({ Key? key }) : super(key: key);

  final double _pageSidePadding = 20;
  final double _pageTopPadding = 63;
  
  final TransactionsViewModel model = serviceLocator<TransactionsViewModel>();

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        margin: EdgeInsets.only(left:_pageSidePadding, right:_pageSidePadding, top: _pageTopPadding),
        child: ChangeNotifierProvider.value(
          value: model,
          child: Consumer<TransactionsViewModel>(
            builder: (context, model, child){
              model.init();
              return  LoadMore(
                onLoadMore: model.loadMore,
                textBuilder: (status){
                  switch(status){
                    case LoadMoreStatus.nomore:
                      return 'No more transactions';
                    case LoadMoreStatus.loading:
                      return 'Loading more transactions...';
                    case LoadMoreStatus.fail:
                      return 'Failed to load more';
                    default:
                      return 'No more transactions';
                  }
                },
                child: ListView.builder(
                  itemCount: model.widgets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return model.widgets[index];
                  },
                ),
              );
            }
          )
        )
      )
    );
  }
}