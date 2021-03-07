import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_ioasys/shared/utils/colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              headline6: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                fontFamily: "Rubik",
                color: Colors.white,
              ),
              button: TextStyle(
                color: AppColors.whisper,
                fontSize: 16,
              ))),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
