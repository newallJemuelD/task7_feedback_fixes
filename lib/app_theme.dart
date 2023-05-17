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
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.teal,
    ),
    // textTheme: TextTheme(
    //   titleLarge: const TextStyle(
    //     color: Colors.white,
    //     fontSize: 20.0,
    //   ),
    //   subtitle1: const TextStyle(
    //     color: Colors.white70,
    //     fontSize: 18.0,
    //   ),
    // ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
  );

//Dark theme
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.black,
    ),
    // textTheme: TextTheme(
    //   titleLarge: const TextStyle(
    //     color: Colors.white,
    //     fontSize: 20.0,
    //   ),
    //   subtitle1: const TextStyle(
    //     color: Colors.white70,
    //     fontSize: 18.0,
    //   ),
    // ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
