abstract class SpeedOMeterState {}

class ResultState extends SpeedOMeterState {
  int value;

  ResultState({required this.value});
}
