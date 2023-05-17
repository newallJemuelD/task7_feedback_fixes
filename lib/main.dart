import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedometer/app_theme.dart';
import 'package:speedometer/bloc/logic_bloc.dart';

import 'speedometer/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      home: BlocProvider(
        create: (context) => LogicBloc(value: 0),
        child: const HomePage(),
      ),
    );
  }
}
