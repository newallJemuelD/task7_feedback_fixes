import 'package:flutter/material.dart';

class AppTheme {
  //
  AppTheme._();

//Light theme
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    cardTheme: const CardTheme(
      color: Colors.blue,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
  );

//Dark theme
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.teal,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    cardTheme: const CardTheme(
      color: Colors.teal,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
