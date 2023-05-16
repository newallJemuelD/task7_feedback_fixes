abstract class SpeedOMeterEvent {}

class ClickEvent extends SpeedOMeterEvent {
  dynamic eventValue;

  ClickEvent(this.eventValue);
}
