import 'package:flutter_bloc/flutter_bloc.dart';

import 'speedometer_event.dart';
import 'speedometer_state.dart';

class SpeedOMeterBloc extends Bloc<SpeedOMeterEvent, SpeedOMeterState> {
  dynamic value;

  SpeedOMeterBloc({required this.value}) : super(ResultState(value: 0)) {
    on<SpeedOMeterEvent>((event, emit) {
      if (event is ClickEvent) {
        emit(ResultState(value: event.eventValue));
      }
    });
  }
}
