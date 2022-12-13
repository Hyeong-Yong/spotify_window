import 'package:flutter/material.dart';

var theme = ThemeData(
    iconTheme: const IconThemeData(color: Colors.white70,),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black38),
    backgroundColor: Colors.black38,
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: TextTheme(
      headline2: const TextStyle(
        color: Colors.red,
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        fontSize: 12.0,
        color: Colors.green[300],
        fontWeight: FontWeight.w500,
        letterSpacing: 2.0,
      ),
      bodyText1: TextStyle(
        color: Colors.red[300],
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.0,
      ),
      bodyText2: const TextStyle(
        color: Colors.white60,
        letterSpacing: 1.0,
      ),
      subtitle1: const TextStyle(
        color: Colors.white70,
        letterSpacing: 1.5,
      ),
      overline: const TextStyle(
        color: Colors.white70
      )
    ),
  );