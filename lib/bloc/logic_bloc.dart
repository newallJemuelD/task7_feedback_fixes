import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_theme.dart';
import 'event.dart';
import 'state.dart';

class LogicBloc extends Bloc<SpeedOMeterEvent, SpeedOMeterState> {
  dynamic value;

  LogicBloc({required this.value}) : super(ResultState(value: 0)) {
    on<SpeedOMeterEvent>((event, emit) {
      if (event is ClickEvent) {
        emit(ResultState(value: event.eventValue));
      }
      if (event is ThemeChangeEvent) {
        ThemeData themeMode =
            event.themeChange ? AppTheme.darkTheme : AppTheme.lightTheme;
        emit(ThemeState(themeChange: event.themeChange, themeData: themeMode));
      }
    });
  }
}
