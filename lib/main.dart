import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:swile_test_technique/core/services/services_locator.dart';
import 'package:swile_test_technique/core/viewModels/main_model.dart';
import 'package:swile_test_technique/ui/router/router.dart';
import 'package:swile_test_technique/ui/shared/theme/app_theme.dart';

////////////////////////////// MAIN /////////////////////////////
/// This is the main widget of the app.
/// It defines the app theme and the router.
/// It also inits other models and the service locator.

void main() {

  // Preventing the landscape mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // init service locator
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  MainModel mainModel = serviceLocator<MainModel>();

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swile Test Technique',
      theme: appTheme,
      onGenerateRoute: Router.generateRoute,
      debugShowCheckedModeBanner: false,
      home: Material(
        color: Theme.of(context).canvasColor,
        child: FutureBuilder(
          future: mainModel.fetchTransactions(),
          builder: (BuildContext context, AsyncSnapshot<Widget> widget) {
            if(widget.connectionState == ConnectionState.done){
              if (!widget.hasData) {
                return Center(
                  child: Text('No Data exists')
                );
              }
              return widget.data!;
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      )
    );
  }
}