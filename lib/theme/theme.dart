import 'package:flutter/material.dart';

String currGenre = '';

bool isDarkTheme = false;
ThemeData currTheme = lightTheme;

IconData iconLight = Icons.wb_sunny;
IconData iconDark = Icons.nights_stay;

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Ubuntu',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.black,
      )
    ),
    primaryColor: Colors.black
  );

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Ubuntu',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
      )
    ),
    primaryColor: Colors.white
  );