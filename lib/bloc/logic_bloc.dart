import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class LogicBloc extends Bloc<SpeedOMeterEvent, SpeedOMeterState> {
  dynamic value;

  LogicBloc({required this.value}) : super(ResultState(value: 0)) {
    on<SpeedOMeterEvent>((event, emit) {
      if (event is ClickEvent) {
        emit(ResultState(value: event.eventValue));
      }
    });
  }
}
