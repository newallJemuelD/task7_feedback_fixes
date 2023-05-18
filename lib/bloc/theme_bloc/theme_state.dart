import 'package:flutter/material.dart';

class ThemeState {}

class ThemeChangeState extends ThemeState {
  bool themeChange;
  ThemeData themeData;

  ThemeChangeState({
    required this.themeChange,
    required this.themeData,
  });
}
