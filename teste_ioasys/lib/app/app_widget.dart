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
              headline4: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Rubik",
                color: Colors.white,
              ),
              headline6: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                fontFamily: "Rubik",
                color: Colors.white,
              ),
              subtitle2: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
                fontFamily: "Rubik",
                color: Colors.black,
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
