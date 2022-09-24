import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluuter_ui/Utils/common/constants.dart';
import 'package:fluuter_ui/screens/LandingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: COLOR_DARK_BLUE,
          textTheme: screenWidth > 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          fontFamily: "Montserrat"),
      home: LandingScreen(),
    );
  }
}
