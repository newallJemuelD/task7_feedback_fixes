import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:speedometer/app_theme.dart';
import 'package:speedometer/bloc/speedometer_bloc/speedometer_bloc.dart';
import 'package:speedometer/bloc/theme_bloc/theme_bloc.dart';
import 'package:speedometer/bloc/theme_bloc/theme_event.dart';
import 'package:speedometer/bloc/theme_bloc/theme_state.dart';
import 'speedometer/home_page.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ThemeBloc(),
      ),
      BlocProvider(
        create: (context) => SpeedOMeterBloc(value: 0),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeBloc? _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<ThemeBloc>(context);
    _bloc!.add(ThemeChangedEvent(true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is ThemeChangeState) {
            return buildWithTheme(state.themeData);
          }
          return buildWithTheme(AppTheme.darkTheme);
        },
      ),
    );
  }

  MaterialApp buildWithTheme(ThemeData themeData) {
    return MaterialApp(
      theme: themeData,
      home: const HomePage(),
    );
  }
}
