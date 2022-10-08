import 'package:flutter/material.dart';
import 'package:testing_with_flutter/core/service_locator.dart';

import 'core/route/router.gr.dart';

Future<void> main() async{
  await ServiceLocator.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
   final _appRouter = AppRouter(); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: _appRouter.delegate(), 
      routeInformationParser: _appRouter.defaultRouteParser()
    );
  }
}

