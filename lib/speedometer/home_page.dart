import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedometer/speedometer/speedometer.dart';

import '../bloc/event.dart';
import '../bloc/logic_bloc.dart';
import '../bloc/state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MainScreenState();
}

class _MainScreenState extends State<HomePage> {
  final myController = TextEditingController();
  String? inputValue;
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          'Task 7 - Speedometer',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  BlocBuilder<LogicBloc, SpeedOMeterState>(
                    builder: (context, state) {
                      if (state is ThemeState) {
                        return Switch.adaptive(
                          value: state.themeChange,
                          onChanged: (value) {
                            context
                                .read<LogicBloc>()
                                .add((ThemeChangeEvent(value)));
                          },
                        );
                      } else {
                        return Switch.adaptive(
                          value: true,
                          onChanged: (value) {
                            context
                                .read<LogicBloc>()
                                .add((ThemeChangeEvent(value)));
                          },
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Dark mode',
                    style: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: BlocBuilder<LogicBloc, SpeedOMeterState>(
                          builder: (context, state) {
                        if (state is ResultState) {
                          inputValue = state.value.toString();
                        }
                        return SpeedOMeter(
                          context: context,
                          //enter size value in the range of 200 to 300
                          size: 250,
                          sColor: Colors.red,
                          rColor: Colors.green,
                          inputValue: inputValue,
                        );
                      }),
                      // ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        inputValue = value;
                      },
                      controller: myController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter a value',
                        hintStyle: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(
                              width: 2.0,
                              color: Theme.of(context).cardTheme.color!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide:
                              const BorderSide(width: 1.0, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<LogicBloc>()
                          .add((ClickEvent(double.parse(inputValue ?? '0.0'))));
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardTheme.color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Go!',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
