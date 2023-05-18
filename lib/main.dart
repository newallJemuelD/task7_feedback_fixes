import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedometer/app_theme.dart';
import 'package:speedometer/bloc/event.dart';
import 'package:speedometer/bloc/logic_bloc.dart';
import 'package:speedometer/bloc/state.dart';

import 'speedometer/home_page.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => LogicBloc(value: 0),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LogicBloc? _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<LogicBloc>(context);
    _bloc!.add(ThemeChangeEvent(true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogicBloc(value: 0),
      child: BlocBuilder<LogicBloc, SpeedOMeterState>(
        builder: (context, state) {
          if (state is ThemeState) {
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
