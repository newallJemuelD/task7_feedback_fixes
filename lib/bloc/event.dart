abstract class SpeedOMeterEvent {}

class ClickEvent extends SpeedOMeterEvent {
  int eventValue;

  ClickEvent(this.eventValue);
}
