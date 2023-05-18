abstract class SpeedOMeterState {}

class ResultState extends SpeedOMeterState {
  dynamic value;

  ResultState({required this.value});
}
