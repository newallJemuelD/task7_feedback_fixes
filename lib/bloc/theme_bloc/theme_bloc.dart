import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedometer/app_theme.dart';

import 'package:speedometer/bloc/theme_bloc/theme_event.dart';
import 'package:speedometer/bloc/theme_bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()) {
    on<ThemeEvent>((event, emit) {
      if (event is ThemeChangedEvent) {
        ThemeData themeMode =
            event.themeChange ? AppTheme.darkTheme : AppTheme.lightTheme;
        emit(ThemeChangeState(
            themeChange: event.themeChange, themeData: themeMode));
      }
    });
  }
}
