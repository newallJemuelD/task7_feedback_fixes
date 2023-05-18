import 'package:flutter/material.dart';

abstract class SpeedOMeterState {}

class ResultState extends SpeedOMeterState {
  dynamic value;

  ResultState({required this.value});
}

class ThemeState extends SpeedOMeterState {
  bool themeChange;
  ThemeData themeData;

  ThemeState({
    required this.themeChange,
    required this.themeData,
  });
}
