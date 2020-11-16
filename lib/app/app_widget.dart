import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: asuka.builder,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
