import 'package:flutter/material.dart';
import 'package:swile_test_technique/core/services/services_locator.dart';
import 'package:swile_test_technique/core/viewModels/transactions_view_model.dart';
import 'package:swile_test_technique/ui/widgets/transaction_details_view/action_item.dart';
import 'package:swile_test_technique/ui/widgets/transaction_details_view/switch_account_button.dart';

////////////////////////////// ACTIONS LIST //////////////////////////////
/// This is the actions list widget.
/// It displays the list of actions of the transaction selected by the user.

class ActionsList extends StatelessWidget {
  
  ActionsList({ Key? key}) : super(key: key);

  final TransactionsViewModel model = serviceLocator<TransactionsViewModel>();
  final Color _defaultIconsColor = const Color.fromARGB(255, 158, 158, 158);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      (model.selectedTransaction!.smallIconCategory.icon != null)?
      ActionItem(
        icon: model.selectedTransaction!.smallIconCategory.icon!,
        iconColor: model.selectedTransaction!.smallIconCategory.color,
        text: model.selectedTransaction!.smallIconCategory.name,
        child: SwitchAccountButton()
      ):
      ActionItem(
        url: model.selectedTransaction!.smallIconUrl, 
        text: model.selectedTransaction!.smallIconCategory.name,
        child: SwitchAccountButton()
      ),
      ActionItem(
        icon: Icons.share,
        iconColor: _defaultIconsColor,
        text: '''Partage d'addition''',
      ),
      ActionItem(
        icon: Icons.favorite,
        iconColor: _defaultIconsColor,
        text: 'Aimer',
      ),
      ActionItem(
        icon: Icons.question_mark_sharp,
        iconColor: _defaultIconsColor,
        text: 'Signaler un problème',
        displayBorders: false,
      ),
      ],
    );
  }
}